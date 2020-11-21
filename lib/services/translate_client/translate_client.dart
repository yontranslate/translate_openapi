import 'package:translate_client/translate_client.dart';
// import 'package:translate_engine_cloudoptai/translate_engine_cloudoptai.dart';
import 'package:translate_engine_deepl/translate_engine_deepl.dart';

export 'package:translate_client/translate_client.dart';

const kDeepLAuthKey = '661c2132-1a50-f0b5-6341-2ecd541ff44d';

// final _cloudoptAIEngine = CloudoptAITranslateEngine();
final _deepLEngine = DeepLTranslateEngine(authKey: kDeepLAuthKey);

final TranslateClient translateClient = TranslateClient([
  // _cloudoptAIEngine,
  _deepLEngine,
]);
