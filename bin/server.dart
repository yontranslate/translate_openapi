import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:translate_openapi/includes.dart';

void main(List<String> args) async {
  await init();

  final server = Jaguar();
  server.add(controllers);

  await server.serve();
}
