import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:dio/dio.dart';

class NotificationRepositories extends Api {
  Future<List<NotificationModel>> getNotification() async {
    try {
      final response = await request(APIUrl.getNotification, Method.get);
      print("response: ${response}");
      return NotificationModel.fromJson(response.data['results'])
          as List<NotificationModel>;
    } on DioError catch (e) {
      throw e;
    }
  }
}
