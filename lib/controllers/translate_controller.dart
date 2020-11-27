import '../translate_openapi.dart';

class TranslateController extends ResourceController {
  @Operation.get()
  Future<Response> translate({
    @Bind.query("text") String text,
  }) async {
    try {
      final TranslateRequest translateRequest = TranslateRequest(text: text);
      final TranslateResponse translateResponse =
          await translateClient.use('tencent').translate(translateRequest);

      final data = translateResponse.toJson();
      return Response.ok(data.removeNulls());
    } on NotFoundException catch (e) {
      return Response.notFound(body: e.toJson());
    } catch (e) {
      return Response.serverError();
    }
  }
}
