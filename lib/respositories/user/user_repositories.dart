import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/account/user_profile.dart';
import 'package:dio/dio.dart';

class UserRepositories extends Api {
  Future<UserProfileModel> getUserProfile() async {
    try {
      UserProfileModel userProfileModel;
      final response = await request(APIUrl.getUserProfile, Method.get);
      userProfileModel = UserProfileModel.fromJson(response.data);
      return userProfileModel;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<UserProfileModel> editUserProfile(
      String firstname, String lastname) async {
    try {
      UserProfileModel userProfileModel;
      Map data = {"first_name": firstname, "last_name": lastname};
      final response =
          await request(APIUrl.getUserProfile, Method.put, body: data);
      userProfileModel = UserProfileModel.fromJson(response.data);
      return userProfileModel;
    } on DioError catch (e) {
      throw e;
    }
  }
}
