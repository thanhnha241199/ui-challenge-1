import 'package:bookkeepa/screens/auth/welcome_screen.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:flutter/material.dart';
import 'package:bookkeepa/util/theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme,
                navigatorKey: NavigationService.instance.navigationKey,
                home: Welcome()),
          );
        },
      ),
    );
  }
}
