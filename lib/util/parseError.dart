import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ParseError extends Equatable {
  final String code;
  final String message;
  ParseError({
    @required this.code,
    @required this.message,
  });
  @override
  List<Object> get props => [code, message];

  static ParseError fromJson(dynamic error) {
    String code = '-1';
    String message = 'Unhandled error has occurred';
    DataError dataError;
    if (error is DioError) {
      code = error.response.statusCode.toString();
      if (error.response.data is Map) {
        dataError = DataError.fromJson(error.response.data);
        code = dataError.rCode ?? code;
        message = dataError.rMessage ?? message;
      } else {
        message = 'Unhandled exception has occurred!';
      }
    } else {
      if (error is Map) {
        dataError = DataError.fromJson(error);
        code = dataError.rCode ?? code;
        message = dataError.rMessage ?? message;
      } else if (error is CognitoClientException) {
        code = error.code;
        message = error.message;
      } else {
        message = 'Unhandled exception has occurred!';
      }
    }
    return ParseError(
      code: code,
      message: message,
    );
  }
}

class DataError extends Equatable {
  final String rCode;
  final String rMessage;

  DataError({this.rCode, this.rMessage});

  @override
  List<Object> get props => [this.rCode, this.rMessage];

  static DataError fromJson(dynamic json) {
    return DataError(
      rCode: json['code'],
      rMessage: json['message'],
    );
  }
}
