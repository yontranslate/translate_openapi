import 'controllers/engine_controller.dart';
import 'controllers/lookup_controller.dart';
import 'translate_openapi.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class TranslateOpenapiChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    /* gets engines */
    router.route("/engines/[:id]").link(() => EngineController());
    router.route("/lookup").link(() => LookUpController());

    router.route("/*").link(() => ReroutingFileController("web"));

    return router;
  }
}

class ReroutingFileController extends FileController {
  ReroutingFileController(String directory) : super(directory);

  @override
  Future<RequestOrResponse> handle(Request request) async {
    final Response potentialResponse = await super.handle(request) as Response;
    final acceptsHTML = request.raw.headers
        .value(HttpHeaders.acceptHeader)
        .contains("text/html");

    if (potentialResponse.statusCode == 404 && acceptsHTML) {
      return Response(
        302,
        {
          HttpHeaders.locationHeader: "/",
          "X-JS-Route": request.path.remainingPath
        },
        null,
      );
    }

    return potentialResponse;
  }
}
