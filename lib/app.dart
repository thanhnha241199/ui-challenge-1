import 'package:bookkeepa/screens/main/main_tab.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      home: Scaffold(
        body: MainTab(),
      ),
    );
  }
}
