import 'package:flutter/widgets.dart';

/// Holds information about our app's flows.
class AppFlow {
  const AppFlow({
    @required this.title,
    @required this.iconData,
    @required this.activeIconData,
    @required this.navigatorKey,
    @required this.child,
  })  : assert(title != null),
        assert(iconData != null),
        assert(activeIconData != null),
        assert(navigatorKey != null),
        assert(child != null);

  final String title;
  final Widget iconData;
  final Widget activeIconData;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
}
