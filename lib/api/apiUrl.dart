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

  // BUSINESS
  static final getBusiness = urlPy + 'api/business/employee/v1_0/';
  static final getLeave = urlPy +
      'api/hr_xero_leave/employee/v1_0/466f8d8a-54a2-4a7a-bb03-fef6603b3ea2/';
}
