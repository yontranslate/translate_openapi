import 'package:translate_client/translate_client.dart';
import 'package:translate_engine_cloudoptai/translate_engine_cloudoptai.dart';
import 'package:translate_engine_deeplpro/translate_engine_deeplpro.dart';

export 'package:translate_client/translate_client.dart';

final _cloudoptAIEngine = CloudoptAITranslateEngine();
final _deepLProEngine = DeepLProTranslateEngine();

final TranslateClient translateClient = TranslateClient([
  _cloudoptAIEngine,
  _deepLProEngine,
]);
