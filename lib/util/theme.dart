import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);
  final storage = new FlutterSecureStorage();
  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.greenAccent,
  );

  static final _darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: AppColors.black,
      primaryColor: AppColors.greenAccent,
      scaffoldBackgroundColor: AppColors.black,
      accentColor: AppColors.black);

  // Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    if (state.brightness == Brightness.dark) {
      storage.write(key: AppConstrants.THEME, value: 'dart');
    } else {
      storage.write(key: AppConstrants.THEME, value: 'light');
    }
  }
}
