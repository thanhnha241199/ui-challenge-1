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
      final _token =
          "eyJraWQiOiJKWlN5R3NFVXJobHJvT2t3dWtFV1ZwNndPS2htMmQrQVRvcGpsWUM5VEZvPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI0NDY5ZTk0OS1hMDdlLTQ4ZGItODhiOC1iMzA1NTBmNjQyZmYiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoZWFzdC0yLmFtYXpvbmF3cy5jb21cL2FwLXNvdXRoZWFzdC0yX3BXY2tJck0zSiIsInBob25lX251bWJlcl92ZXJpZmllZCI6ZmFsc2UsImNvZ25pdG86dXNlcm5hbWUiOiI0MDYwNjkyZC1mNWIzLTQ0MDYtOGIyMS1jYmZlZGY4ZWVhMDUiLCJhdWQiOiIxbGtxNTJta3I0OTBtYmw1ZmtjOHBvdTE5MCIsImV2ZW50X2lkIjoiYzk5ODU5MDItOTZkMi00YmE3LTg0NTAtNTgwODgxOGNlNmJjIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE2MjEyNDUxNTgsInBob25lX251bWJlciI6Iis2MTQxMTY2NjY2NiIsImV4cCI6MTYyMTI0ODc1OCwiaWF0IjoxNjIxMjQ1MTU4LCJlbWFpbCI6Im5ld3QuZW1wbG95ZWVAbWFpbGluYXRvci5jb20ifQ.G2QTenuvkf1x0C1RmyooxXuliPEeCBE8Tk4bVG3jRYArzSfuvfSbmn1DOnH-HhrfXOEtT6kgwaDa_VwRF0hJL1_XNqDlo2LxqBz6JfF7sTj55O68uqgaHFxDYDad7NV8TjnzmSc_9nFFqasStYKzwFfPUQ0MhsYPtQZmAVDm4mS3PMIOzb207mBNVar6qgov42a2xZpNigOmt7Y29lbeU4taVEJQeNBkAhVwRbpfbtBox8gJDlKJDfedQzfCmFAOhWsfWmgjz6k_ORfsCQW3fvNg8uVXJ4_1jDQa183UVffs8M9CQthdYZCW_j8g9aWMYUUFz_FT0cVFvmeVfBV83w"; //await CongnitoService().getToken();
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
