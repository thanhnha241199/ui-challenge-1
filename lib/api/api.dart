import 'dart:collection';
import 'dart:io';
import 'package:bookkeepa/util/cognito_service.dart';
import 'package:dio/dio.dart';

enum Method { post, put, patch, delete, get }

class Api {
  final dio = Dio();

  Future<dynamic> request(
    url,
    Method method, {
    body,
    params,
    useIDToken = true,
    headersOverwrite,
  }) async {
    Map headers = {
      'cache-control': 'cache',
      'Content-Type': 'application/json',
    };

    if (useIDToken) {
      if (await CongnitoService().hasExpireToken())
        await CongnitoService().refreshToken();
      final _token = await CongnitoService().getToken();
      print("token ${_token}");
      headers['Authorization'] = 'Bearer $_token';
    }

    var combinedMap = headers;
    if (headersOverwrite != null) {
      var mapList = [headers, headersOverwrite];
      combinedMap = mapList.reduce((map1, map2) => map1..addAll(map2));
    }
    Map<String, String> header = HashMap.from(combinedMap);

    try {
      if (method == Method.post) {
        return await dio.post(url,
            data: body,
            options: Options(
              headers: header,
            ),
            queryParameters: params);
      } else if (method == Method.put) {
        return await dio.put(url,
            data: body,
            options: Options(headers: header),
            queryParameters: params);
      } else if (method == Method.patch) {
        return await dio.patch(url,
            data: body,
            options: Options(headers: header),
            queryParameters: params);
      } else if (method == Method.delete) {
        return await dio.delete(url,
            options: Options(headers: header), queryParameters: params);
      }
      return await dio.get(url,
          options: Options(headers: header), queryParameters: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> requestUploadImage(url, Method method, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await request(url, method, body: formData);
  }
}
