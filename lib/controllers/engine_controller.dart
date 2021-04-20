import 'package:jaguar/jaguar.dart';
import 'package:translate_client/translate_client.dart';

import '../includes.dart';

@GenController(path: '/engines')
class EngineController extends Controller {
  @GetJson()
  Future<List<Map<String, dynamic>>> getEngines(Context ctx) async {
    final data = translateClient.engines.map((e) => e.toJson()).toList();
    return data.removeNulls();
  }

  @GetJson(path: '/:identifier')
  Future<Map<String, dynamic>> getEngine(Context ctx) async {
    String identifier = ctx.pathParams.get('identifier');
    final TranslationEngine engine = translateClient.engines.firstWhere(
      (e) => e.identifier == identifier,
      orElse: () => null,
    );

    final data = engine.toJson();
    return data.removeNulls();
  }

  @GetJson(path: '/:identifier/lookup')
  Future<Map<String, dynamic>> lookup(Context ctx) async {
    String identifier = ctx.pathParams.get('identifier');
    String word = ctx.query.get('word');

    final LookUpRequest request = LookUpRequest(
      word: word,
      sourceLanguage: Language.EN,
      targetLanguage: Language.ZH,
    );
    final LookUpResponse response =
        await translateClient.use(identifier).lookUp(request);

    final data = response.toJson();
    return data.removeNulls();
  }

  @GetJson(path: '/:identifier/translate')
  Future<Map<String, dynamic>> translate(Context ctx) async {
    String identifier = ctx.pathParams.get('identifier');
    String text = ctx.query.get('text');

    final TranslateRequest request = TranslateRequest(
      text: text,
      sourceLanguage: Language.EN,
      targetLanguage: Language.ZH,
    );
    final TranslateResponse response =
        await translateClient.use(identifier).translate(request);

    final data = response.toJson();
    return data.removeNulls();
  }
}
