import 'package:translate_client/translate_client.dart';
import 'package:translate_engine_caiyun/translate_engine_caiyun.dart';
import 'package:translate_engine_cloudoptai/translate_engine_cloudoptai.dart';
import 'package:translate_engine_deepl/translate_engine_deepl.dart';
import 'package:translate_engine_iciba/translate_engine_iciba.dart';
import 'package:translate_engine_sogou/translate_engine_sogou.dart';
import 'package:translate_engine_youdao/translate_engine_youdao.dart';

import '../../translate_openapi.dart';

export 'package:translate_client/translate_client.dart';

TranslateClient translateClient;

void initTranslateClient(TranslateOpenAPIConfig config) {
  if (translateClient == null) {
    TranslateEngine _caiyunTranslateEngine;
    TranslateEngine _cloudoptAITranslateEngine;
    TranslateEngine _deepLTranslateEngine;
    TranslateEngine _icibaTranslateEngine;
    TranslateEngine _sogouTranslateEngine;
    TranslateEngine _youdaoTranslateEngine;

    for (var e in config.translateEngines) {
      switch (e['name']) {
        case 'caiyun':
          _caiyunTranslateEngine = CaiyunTranslateEngine(
            token: 'lbxx4z7car1w06dxgoqr',
            requestId: 'yontranslate',
          );
          break;
        case 'cloudoptai':
          _cloudoptAITranslateEngine = CloudoptAITranslateEngine();
          break;
        case 'deepl':
          _deepLTranslateEngine = DeepLTranslateEngine(
            authKey: e['authKey'],
          );
          break;
        case 'iciba':
          _icibaTranslateEngine = IcibaTranslateEngine(
            key: e['key'],
          );
          break;
        case 'sogou':
          _sogouTranslateEngine = SogouTranslateEngine(
            pid: e['pid'],
            key: e['key'],
          );
          break;
        case 'youdao':
          _youdaoTranslateEngine = YoudaoTranslateEngine(
            appKey: e['appKey'],
            appSecret: e['appSecret'],
          );
          break;
      }
    }

    translateClient = TranslateClient([
      _caiyunTranslateEngine,
      _cloudoptAITranslateEngine,
      _deepLTranslateEngine,
      _icibaTranslateEngine,
      _sogouTranslateEngine,
      _youdaoTranslateEngine,
    ].where((e) => e != null).toList());
  }
}
