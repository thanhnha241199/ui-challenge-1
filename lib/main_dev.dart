import 'package:bookkeepa/bloc_manager.dart';
import 'package:bookkeepa/config/env.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  AppConfig().setAppConfig(
    appEnvironment: AppEnvironment.DEV,
    baseUrlGo: 'https://api.com/',
    baseUrlPython: 'https://api.com/',
    userPoolId: 'xxxxxx',
    clientId: 'xxxxxxx',
  );

  Bloc.observer = SimpleBlocObserver();
  runApp(BlocManager());
}
