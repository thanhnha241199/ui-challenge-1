import 'package:bookkeepa/config/env.dart';

final versionApi = ''; //if any ~> /1.0;
final urlGo = AppConfig().baseUrlGo + versionApi;
final urlPy = AppConfig().baseUrlPython;

class APIUrl {
  // AUTHENTICATION
  static final getLogin = urlPy + 'api/auth/login/';

  // NOTIFICATION
  static final getNotification = urlPy + 'api/notification/employee/v1_0/';

  // USERPROFILE
  static final getUserProfile = urlPy + 'api/auth/profile/';

  // USERPROFILE
  static final getBusiness = urlPy + 'api/business/employee/v1_0/';
}
