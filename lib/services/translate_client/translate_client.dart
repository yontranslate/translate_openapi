import 'package:translate_client/translate_client.dart';
import 'package:translate_engine_baidu/translate_engine_baidu.dart';
import 'package:translate_engine_caiyun/translate_engine_caiyun.dart';
import 'package:translate_engine_cloudoptai/translate_engine_cloudoptai.dart';
import 'package:translate_engine_deepl/translate_engine_deepl.dart';
import 'package:translate_engine_iciba/translate_engine_iciba.dart';
import 'package:translate_engine_sogou/translate_engine_sogou.dart';
import 'package:translate_engine_tencent/translate_engine_tencent.dart';
import 'package:translate_engine_youdao/translate_engine_youdao.dart';

import '../../translate_openapi.dart';

export 'package:translate_client/translate_client.dart';

const _kEngineBaidu = 'baidu';
const _kEngineCaiyun = 'caiyun';
const _kEngineCloudoptAI = 'cloudoptai';
const _kEngineDeepL = 'deepl';
const _kEngineIciba = 'iciba';
const _kEngineSogou = 'sogou';
const _kEngineTencent = 'tencent';
const _kEngineYoudao = 'youdao';

TranslateClient translateClient;

dynamic _getEngineConfig(
  TranslateOpenAPIConfig config,
  String key,
  Function(Map<String, dynamic> engineConfig) callback,
) {
  final engineConfig = (config?.translateEngines ?? []).firstWhere((e) {
    return e['name'] == key;
  });
  if (engineConfig != null) {
    callback(engineConfig);
  }
}

void initTranslateClient(TranslateOpenAPIConfig config) {
  if (translateClient == null) {
    TranslateEngine _baiduTranslateEngine;
    TranslateEngine _caiyunTranslateEngine;
    TranslateEngine _cloudoptAITranslateEngine;
    TranslateEngine _deepLTranslateEngine;
    TranslateEngine _icibaTranslateEngine;
    TranslateEngine _sogouTranslateEngine;
    TranslateEngine _tencentTranslateEngine;
    TranslateEngine _youdaoTranslateEngine;

    _getEngineConfig(config, _kEngineBaidu, (ec) {
      _baiduTranslateEngine = BaiduTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineCaiyun, (ec) {
      _caiyunTranslateEngine = CaiyunTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineCloudoptAI, (ec) {
      _cloudoptAITranslateEngine = CloudoptAITranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineDeepL, (ec) {
      _deepLTranslateEngine = DeepLTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineIciba, (ec) {
      _icibaTranslateEngine = IcibaTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineSogou, (ec) {
      _sogouTranslateEngine = SogouTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineTencent, (ec) {
      _tencentTranslateEngine = TencentTranslateEngine.newInstance(ec);
    });
    _getEngineConfig(config, _kEngineYoudao, (ec) {
      _youdaoTranslateEngine = YoudaoTranslateEngine.newInstance(ec);
    });

    translateClient = TranslateClient([
      _baiduTranslateEngine,
      _caiyunTranslateEngine,
      _cloudoptAITranslateEngine,
      _deepLTranslateEngine,
      _icibaTranslateEngine,
      _sogouTranslateEngine,
      _tencentTranslateEngine,
      _youdaoTranslateEngine,
    ].where((e) => e != null).toList());
  }
}
