import '../translate_client/translate_client.dart';
import '../translate_openapi.dart';
import '../utils/remove_nulls.dart';

class EngineController extends ResourceController {
  @Operation.get()
  Future<Response> getEngines() async {
    final data = translateClient.engines.map((e) => e.toJson()).toList();

    return Response.ok(data.removeNulls());
  }

  @Operation.get("id")
  Future<Response> getEngine(
    @Bind.path("id") String id,
  ) async {
    final TranslateEngine engine = translateClient.engines.firstWhere(
      (e) => e.id == id,
      orElse: () => null,
    );

    final data = engine.toJson();
    return Response.ok(data.removeNulls());
  }
}
