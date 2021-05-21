import 'package:bookkeepa/api/api.dart';
import 'package:bookkeepa/api/apiUrl.dart';
import 'package:bookkeepa/models/business/business.dart';
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
}
