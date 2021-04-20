import 'dart:io';
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

class TranslationEngineConfig {
  final String type;
  final String identifier;
  final String name;
  final Map option;

  TranslationEngineConfig({
    this.type,
    this.identifier,
    this.name,
    this.option,
  });

  factory TranslationEngineConfig.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return TranslationEngineConfig(
      type: json['type'],
      identifier: json['identifier'],
      name: json['name'],
      option: json['option'] != null
          ? Map<String, dynamic>.from(json['option'])
          : null,
    );
  }
}
