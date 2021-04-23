import 'package:bookkeepa/blocs/auth/auth_bloc.dart';
import 'package:bookkeepa/config/languages/localised.dart';
import 'package:bookkeepa/models/auth/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTranslations {
  final Map<dynamic, dynamic> localisedValues = Languages.localised;
  String getLanguage(BuildContext context, String key) {
    UserData userData = BlocProvider.of<AuthBloc>(context).state.userData;
    String language = 'en';
    if (userData != null) {
      language = userData.language;
    }
    return AppTranslations().localisedValues[key] is Map
        ? AppTranslations().localisedValues[key][language]
        : key;
  }
}
