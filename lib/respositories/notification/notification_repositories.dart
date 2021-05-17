import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/auth/user_data.dart';
import 'package:dio/dio.dart';

class NotificationRepositories extends Api {
  Future<List<UserData>> getNotification() async {
    try {
      final response =
          await request(APIUrl.getNotification, Method.get, useIDToken: false);
      print(APIUrl.getNotification);
      print(response.data);
      return UserData.fromJson(response.data['results']) as List<UserData>;
    } on DioError catch (e) {
      throw e;
    }
  }
}
