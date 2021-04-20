import 'package:jaguar_reflect/jaguar_reflect.dart';

import './engine_controller.dart';

export './engine_controller.dart';

final List<Route> controllers = []..addAll(reflect(EngineController()));
