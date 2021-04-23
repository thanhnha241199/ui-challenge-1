import 'package:bookkeepa/config/env.dart';

final versionApi = ''; //if any ~> /1.0;
final urlGo = AppConfig().baseUrlGo + versionApi;
final urlPy = AppConfig().baseUrlPython + versionApi;

class APIUrl {
  // AUTHENTICATION
  static final getStarted = urlPy + 'auth/get-started/';
}
