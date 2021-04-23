import 'package:flutter/material.dart';

enum AppEnvironment { DEV, STAGE, PROD }

class AppConfig {
  // Singleton object
  static final AppConfig _singleton = new AppConfig._internal();

  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();

  AppEnvironment appEnvironment;
  String baseUrlPython;
  String baseUrlGo;
  String userPoolId;
  String clientId;
  ThemeData themeData;

  // Set app configuration with single function
  void setAppConfig({
    AppEnvironment appEnvironment,
    String baseUrlPython,
    String baseUrlGo,
    String userPoolId,
    String clientId,
    ThemeData themeData,
  }) {
    this.appEnvironment = appEnvironment;
    this.baseUrlPython = baseUrlPython;
    this.baseUrlGo = baseUrlGo;
    this.userPoolId = userPoolId;
    this.clientId = clientId;
    this.themeData = themeData;
  }
}
