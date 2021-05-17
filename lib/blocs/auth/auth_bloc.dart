import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/models/auth/user_data.dart';
import 'package:bookkeepa/screens/auth/login_screen.dart';
import 'package:bookkeepa/screens/auth/signup_screen.dart';
import 'package:bookkeepa/screens/auth/verify_code_screen.dart';
import 'package:bookkeepa/screens/auth/welcome_screen.dart';
import 'package:bookkeepa/screens/main/main_tab.dart';
import 'package:bookkeepa/util/cognito_service.dart';
import 'package:bookkeepa/util/parseError.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/respositories/auth/auth_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookkeepa/respositories/auth/index.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepositories authRepositories = AuthRepositories();
  AuthBloc() : super(AuthState.empty());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthGetStarted) {
      yield* authGetStarted(event.phoneNumber);
    }
    if (event is AuthLogin) {
      yield* authLogin(event.phoneNumber, event.password);
    }
    if (event is AuthInitLogin) {
      yield* authInit();
    }
    if (event is AuthLogout) {
      yield* authLogout();
    }
    if (event is AuthDismissError) {
      state.copyWith(errorMessage: '');
    }
    if (event is AuthVerifyCode) {
      yield* authVerifyCode(event.phoneNumber, event.code);
    }
    if (event is AuthSignUp) {
      yield* authSignUp(event.registerId, event.password, event.phoneNumber);
    }
  }

  Stream<AuthState> authLogin(String phoneNumber, String password) async* {
    try {
      yield state.copyWith(requesting: true);
      dynamic sesstion = await CongnitoService()
          .loginCognito(userName: phoneNumber, password: password);
      print(sesstion);
      await CongnitoService()
          .persistToken(phoneNumber, password, sesstion['token']);
      yield state.copyWith(requesting: false);
      NavigationService.instance.navigateTo(MainTab());
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }

  Stream<AuthState> authInit() async* {
    try {
      yield state.copyWith(requesting: true);
      if (await CongnitoService().hasToken()) {
        if (await CongnitoService().hasExpireToken())
          await CongnitoService().refreshToken();
        NavigationService.instance.navigateTo(MainTab());
      } else {
        NavigationService.instance.navigateTo(Welcome());
      }
      yield state.copyWith(requesting: false);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }

  Stream<AuthState> authLogout() async* {
    try {
      yield state.copyWith(requesting: true);
      await CongnitoService().deleteToken();
      NavigationService.instance.navigateToReplacement(Welcome());
      yield state.copyWith(requesting: false);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }

  Stream<AuthState> authGetStarted(String phoneNumber) async* {
    try {
      yield state.copyWith(requesting: true);
      UserData data = await authRepositories.getStartLogin(phoneNumber);
      yield state.copyWith(
          requesting: false, phone: phoneNumber, userData: data);
      if (data.isActive) {
        if (data.registerd) {
          if (data.isVerifiedPhone) {
            NavigationService.instance.navigateTo(Login());
          } else {
            NavigationService.instance.navigateTo(VerifyCode());
          }
        } else {
          NavigationService.instance.navigateTo(SignUp());
        }
      }
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }

  Stream<AuthState> authSignUp(
      String registerId, String password, String phoneNumber) async* {
    try {
      yield state.copyWith(requesting: true);
      await CongnitoService().signUpCognito(
          userName: registerId, password: password, phoneNumber: phoneNumber);
      yield state.copyWith(
          requesting: false, password: password, userData: state.userData);
      NavigationService.instance.navigateToReplacement(VerifyCode());
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }

  Stream<AuthState> authVerifyCode(String phoneNumber, String code) async* {
    try {
      yield state.copyWith(requesting: true);
      bool isConfirm = await CongnitoService()
          .verifyCodeCognito(userName: phoneNumber, code: code);
      yield state.copyWith(requesting: false);
      if (isConfirm) {
        NavigationService.instance.navigateToReplacement(MainTab());
      }
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
          errorCode: error.code,
          errorMessage: error.message,
          requesting: false);
    }
  }
}
