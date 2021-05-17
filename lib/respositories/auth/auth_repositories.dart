import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/auth/user_data.dart';
import 'package:dio/dio.dart';

class AuthRepositories extends Api {
  Future<UserData> getStartLogin(String phoneNumber) async {
    try {
      dynamic data = {'phone_number': phoneNumber};
      final response = await request(APIUrl.getLogin, Method.post,
          body: data, useIDToken: false);
      return UserData.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<UserData> startLogin(String username, String password) async {
    try {
      dynamic data = {'username': username, "password": password};
      final response = await request(APIUrl.getLogin, Method.post,
          body: data, useIDToken: false);
      return UserData.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }
}
