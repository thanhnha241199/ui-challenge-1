import 'package:bookkeepa/widgets/navigator/adaptive_bottom_navigation_scaffold.dart';
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigationKey;
  GlobalKey<AdaptiveBottomNavigationScaffoldState> apdaterKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
    apdaterKey = GlobalKey<AdaptiveBottomNavigationScaffoldState>();
  }

  ///Push page without context
  Future<dynamic> navigateToReplacement(Widget _rn) {
    return navigationKey.currentState
        .pushReplacement(MaterialPageRoute(builder: (_) => _rn));
  }

  Future<dynamic> navigateTo(Widget _rn) {
    return navigationKey.currentState
        .push(MaterialPageRoute(builder: (_) => _rn));
  }

  goback() {
    return navigationKey.currentState.pop();
  }

  ///Push page with context because it can handle inside or outside bottom tab bar
  void pushPage(
      BuildContext context, bool isHorizontalNavigation, Widget screen) {
    // If it's not horizontal navigation,
    // we should use the rootNavigator.
    Navigator.of(context, rootNavigator: !isHorizontalNavigation).push(
      _buildAdaptivePageRoute(
        builder: (context) => screen,
      ),
    );
  }

// Flutter will use the fullscreenDialog property to change the animation
// and the app bar's left icon to an X instead of an arrow.
  PageRoute<T> _buildAdaptivePageRoute<T>({
    @required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) =>
      MaterialPageRoute(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      );

  ///call change index bottom tab bar in another classes without params
  onChangeTab(int number) {
    apdaterKey.currentState.onTabSelected(number);
  }
}
