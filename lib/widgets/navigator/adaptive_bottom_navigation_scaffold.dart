import 'package:flutter/material.dart';
import 'index.dart';
import 'package:flutter/widgets.dart';

/// A platform-aware Scaffold which encapsulates the common behaviour between
/// material's and cupertino's bottom navigation pattern.
class AdaptiveBottomNavigationScaffold extends StatefulWidget {
  /// List of the tabs to be displayed with their respective navigator's keys.
  final List<BottomNavigationTab> navigationBarItems;

  const AdaptiveBottomNavigationScaffold({
    this.navigationBarItems,
    Key key,
  }) : super(key: key);

  @override
  AdaptiveBottomNavigationScaffoldState createState() =>
      AdaptiveBottomNavigationScaffoldState();
}

class AdaptiveBottomNavigationScaffoldState
    extends State<AdaptiveBottomNavigationScaffold> {
  int _currentlySelectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      // We're preventing the root navigator from popping and closing the app
      // when the back button is pressed and the inner navigator can handle
      // it. That occurs when the inner has more than one page on its stack.
      // You can comment the onWillPop callback and watch "the bug".
      onWillPop: () async => !await widget
          .navigationBarItems[_currentlySelectedIndex].navigatorKey.currentState
          .maybePop(),
      child: _buildMaterial(context));

  Widget _buildMaterial(BuildContext context) =>
      MaterialBottomNavigationScaffold(
        navigationBarItems: widget.navigationBarItems,
        onItemSelected: onTabSelected,
        selectedIndex: _currentlySelectedIndex,
      );

  /// Called when a tab selection occurs.
  void onTabSelected(int newIndex) {
    if (_currentlySelectedIndex == newIndex) {
      // If the user is re-selecting the tab, the common
      // behavior is to empty the stack.
      widget.navigationBarItems[newIndex].navigatorKey.currentState
          .popUntil((route) => route.isFirst);
    }
    setState(() {
      _currentlySelectedIndex = newIndex;
    });
  }
}
