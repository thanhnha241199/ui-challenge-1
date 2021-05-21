import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:dio/dio.dart';

class NotificationRepositories extends Api {
  Future<List<NotificationModel>> getNotification() async {
    try {
      List<NotificationModel> notificationData = [];
      final response = await request(APIUrl.getNotification, Method.get);
      response.data['results']
          .map((e) => notificationData.add(NotificationModel.fromJson(e)))
          .toList();
      return notificationData;
    } on DioError catch (e) {
      throw e;
    }
  }
}
