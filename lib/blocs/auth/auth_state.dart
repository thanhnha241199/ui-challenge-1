import 'package:bookkeepa/models/auth/user_data.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool requesting;
  final String errorCode;
  final String errorMessage;
  final String phone;
  final String password;
  final UserData userData;

  AuthState({
    this.requesting,
    this.errorCode,
    this.errorMessage,
    this.userData,
    this.phone,
    this.password,
  });

  @override
  List<Object> get props =>
      [this.requesting, this.errorCode, this.errorMessage, this.userData];
  factory AuthState.empty() {
    return AuthState(
      requesting: false,
      errorCode: '',
      errorMessage: '',
    );
  }

  copyWith(
      {UserData userData,
      bool requesting,
      String errorCode,
      String errorMessage,
      String phone,
      String password}) {
    return (AuthState(
      userData: userData ?? this.userData,
      requesting: requesting ?? false,
      errorCode: errorCode ?? '',
      errorMessage: errorMessage ?? '',
      phone: phone ?? this.phone,
      password: password ?? this.password,
    ));
  }
}
