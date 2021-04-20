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

      String identifier = engineConfig.identifier;
      String name = engineConfig.name;
      Map<String, dynamic> option = engineConfig.option;

      switch (engineConfig.type) {
        case kEngineTypeBaidu:
          translationEngine = BaiduTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeCaiyun:
          translationEngine = CaiyunTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeCloudoptAI:
          translationEngine = CloudoptAITranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeDeepL:
          translationEngine = DeepLTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeIBMWatson:
          translationEngine = IBMWatsonTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeIciba:
          translationEngine = IcibaTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeSogou:
          translationEngine = SogouTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeTencent:
          translationEngine = TencentTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
        case kEngineTypeYoudao:
          translationEngine = YoudaoTranslationEngine(
            identifier: identifier,
            name: name,
            option: option,
          );
          break;
      }
      if (translationEngine != null) {
        translationEngines.add(translationEngine);
      }
    }

    translateClient = TranslateClient(translationEngines);
  }
}
