import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const <dynamic>[]]);
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String phoneNumber;
  final String password;
  AuthLogin({@required this.phoneNumber, this.password})
      : super([phoneNumber, password]);
}

class AuthInitLogin extends AuthEvent {}

class AuthGetStarted extends AuthEvent {
  final String phoneNumber;
  AuthGetStarted({@required this.phoneNumber}) : super([phoneNumber]);
}

class AuthLogout extends AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String registerId;
  final String password;
  final String phoneNumber;

  AuthSignUp(
      {@required this.password,
      @required this.registerId,
      @required this.phoneNumber})
      : super([registerId, password, phoneNumber]);
}

class AuthVerifyCode extends AuthEvent {
  final String phoneNumber;
  final String code;
  AuthVerifyCode({@required this.code, @required this.phoneNumber})
      : super([phoneNumber, code]);
}

class AuthDismissError extends AuthEvent {}
