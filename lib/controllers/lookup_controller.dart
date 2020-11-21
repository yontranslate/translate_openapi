import '../translate_openapi.dart';

class LookUpController extends ResourceController {
  @Operation.get()
  Future<Response> lookUp({
    @Bind.query("word") String word,
  }) async {
    try {
      final LookUpRequest lookUpRequest = LookUpRequest(word: word);
      final LookUpResponse lookUpResponse =
          await translateClient.firstEngine.lookUp(lookUpRequest);

      final data = lookUpResponse.toJson();
      return Response.ok(data.removeNulls());
    } on NotFoundException catch (e) {
      return Response.notFound(body: e.toJson());
    } catch (e) {
      return Response.serverError();
    }
  }
}
