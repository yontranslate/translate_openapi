import 'package:translate_client/translate_client.dart';
import 'package:translation_engine_baidu/translation_engine_baidu.dart';
import 'package:translation_engine_caiyun/translation_engine_caiyun.dart';
import 'package:translation_engine_cloudoptai/translation_engine_cloudoptai.dart';
import 'package:translation_engine_deepl/translation_engine_deepl.dart';
import 'package:translation_engine_ibmwatson/translation_engine_ibmwatson.dart';
import 'package:translation_engine_iciba/translation_engine_iciba.dart';
import 'package:translation_engine_sogou/translation_engine_sogou.dart';
import 'package:translation_engine_tencent/translation_engine_tencent.dart';
import 'package:translation_engine_youdao/translation_engine_youdao.dart';

import '../../includes.dart';

TranslateClient translateClient;

void initTranslateClient() {
  if (translateClient == null) {
    List<TranslationEngine> translationEngines = [];
    for (var engineConfig in sharedConfig.translationEngines) {
      TranslationEngine translationEngine;

      switch (engineConfig.type) {
        case kEngineTypeBaidu:
          translationEngine = BaiduTranslationEngine(engineConfig);
          break;
        case kEngineTypeCaiyun:
          translationEngine = CaiyunTranslationEngine(engineConfig);
          break;
        case kEngineTypeCloudoptAI:
          translationEngine = CloudoptAITranslationEngine(engineConfig);
          break;
        case kEngineTypeDeepL:
          translationEngine = DeepLTranslationEngine(engineConfig);
          break;
        case kEngineTypeIBMWatson:
          translationEngine = IBMWatsonTranslationEngine(engineConfig);
          break;
        case kEngineTypeIciba:
          translationEngine = IcibaTranslationEngine(engineConfig);
          break;
        case kEngineTypeSogou:
          translationEngine = SogouTranslationEngine(engineConfig);
          break;
        case kEngineTypeTencent:
          translationEngine = TencentTranslationEngine(engineConfig);
          break;
        case kEngineTypeYoudao:
          translationEngine = YoudaoTranslationEngine(engineConfig);
          break;
      }
      if (translationEngine != null) {
        translationEngines.add(translationEngine);
      }
    }

    translateClient = TranslateClient(
      DefaultTranslateClientAdapter(translationEngines),
    );
  }
}
