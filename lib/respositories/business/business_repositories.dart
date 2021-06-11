import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/models/leave/leave.dart';
import 'package:dio/dio.dart';

class BussinessRepositories extends Api {
  Future<List<BusinessModel>> getBusiness() async {
    try {
      List<BusinessModel> businessModel = [];
      final response = await request(APIUrl.getBusiness, Method.get);
      response.data['results']
          .map((e) => businessModel.add(BusinessModel.fromJson(e)))
          .toList();
      return businessModel;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<LeaveModel>> getLeave() async {
    try {
      List<LeaveModel> leaveModel = [];
      final response = await request(APIUrl.getLeave, Method.get);
      response.data['results']
          .map((e) => leaveModel.add(LeaveModel.fromJson(e)))
          .toList();
      return leaveModel;
    } on DioError catch (e) {
      throw e;
    }
  }
}
