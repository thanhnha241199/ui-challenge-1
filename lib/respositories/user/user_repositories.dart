import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/account/user_profile.dart';
import 'package:dio/dio.dart';

class UserRepositories extends Api {
  Future<UserProfileModel> getNotification() async {
    print("aaa");
    try {
      final response = await request(APIUrl.getNotification, Method.get);
      print("Respose: ${response}");
      return UserProfileModel.fromJson(response.data['results']);
    } on DioError catch (e) {
      throw e;
    }
  }
}
