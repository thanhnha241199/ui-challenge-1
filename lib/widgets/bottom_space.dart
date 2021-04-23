import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class BottomSpace extends StatefulWidget {
  BottomSpace({Key key}) : super(key: key);

  @override
  _BottomSpaceState createState() => _BottomSpaceState();
}

class _BottomSpaceState extends State<BottomSpace> {
  KeyboardVisibilityNotification _keyboardVisibility =
      new KeyboardVisibilityNotification();

  int _keyboardVisibilitySubscriberId;
  bool _keyboardState;

  @override
  void initState() {
    super.initState();
    _keyboardState = true;
    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardState = visible;
        });
      },
    );
  }

  @override
  @mustCallSuper
  void dispose() {
    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bottomStatus = MediaQuery.of(context).viewPadding.bottom;
    double heightBottom =
        _keyboardState ? 10.0 : (50 - bottomStatus) + bottomStatus;
    return Container(
      height: heightBottom,
    );
  }
}
