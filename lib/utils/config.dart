import 'dart:io';
import 'package:translate_client/translate_client.dart';
import 'package:yaml/yaml.dart';

Future<void> initConfig(String type) async {
  final String jsonString = File('config.yaml').readAsStringSync();
  final YamlMap json = loadYaml(jsonString);
  Config.getInstance().parse(json);
}

class Config {
  static Config _instance;
  Config._internal();

  static Config getInstance() {
    if (_instance == null) {
      _instance = Config._internal();
    }
    return _instance;
  }

  void parse(YamlMap json) {
    env = json['env'] as String;
    if (json['translationEngines'] != null) {
      Iterable l = json['translationEngines'] as List;
      translationEngines = l.map((item) {
        Map<String, dynamic> j = Map<String, dynamic>.from(item);
        return TranslationEngineConfig.fromJson(j);
      }).toList();
    }
  }

  String env;
  List<TranslationEngineConfig> translationEngines;
}
