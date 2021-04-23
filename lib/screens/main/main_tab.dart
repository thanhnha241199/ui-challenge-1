import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/screens/dashboard/dashboard.dart';
import 'package:bookkeepa/screens/leave/leave.dart';
import 'package:bookkeepa/screens/main/widgets/bottom_bar_item.dart';
import 'package:bookkeepa/screens/payslips/payslips.dart';
import 'package:bookkeepa/screens/rosters/rosters.dart';
import 'package:bookkeepa/screens/timesheets/timesheets.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/navigator/adaptive_bottom_navigation_scaffold.dart';
import 'package:bookkeepa/widgets/navigator/app_flow.dart';
import 'package:bookkeepa/widgets/navigator/bottom_navigation_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  List<AppFlow> appFlows;
  @override
  void initState() {
    super.initState();
    appFlows = [
      AppFlow(
        title: AppTranslations().getLanguage(context, 'dashBoard'),
        iconData: BottomBarItem(
          imgUrl: AppImage.house,
          width: 22.0,
          color: AppColors.greyColorBottomTab,
        ),
        activeIconData: BottomBarItem(
          imgUrl: AppImage.house,
          width: 22.0,
          color: AppColors.turquoiseColor,
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        child: Dashboard(),
      ),
      AppFlow(
        title: AppTranslations().getLanguage(context, 'payslips'),
        iconData: BottomBarItem(
          imgUrl: AppImage.payslips,
          width: 26.0,
          color: AppColors.greyColorBottomTab,
        ),
        activeIconData: BottomBarItem(
          imgUrl: AppImage.payslips,
          width: 26.0,
          color: AppColors.turquoiseColor,
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        child: Payslips(),
      ),
      AppFlow(
        title: AppTranslations().getLanguage(context, 'rosters'),
        iconData: BottomBarItem(
          imgUrl: AppImage.rosters,
          width: 26.0,
          color: AppColors.greyColorBottomTab,
        ),
        activeIconData: BottomBarItem(
          imgUrl: AppImage.rosters,
          width: 26.0,
          color: AppColors.turquoiseColor,
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        child: Rosters(),
      ),
      AppFlow(
        title: AppTranslations().getLanguage(context, 'timesheets'),
        iconData: BottomBarItem(
          imgUrl: AppImage.timesheets,
          width: 26.0,
          color: AppColors.greyColorBottomTab,
        ),
        activeIconData: BottomBarItem(
          imgUrl: AppImage.timesheets,
          width: 26.0,
          color: AppColors.turquoiseColor,
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        child: Timesheets(),
      ),
      AppFlow(
        title: AppTranslations().getLanguage(context, 'leave'),
        iconData: BottomBarItem(
          imgUrl: AppImage.leave,
          width: 22.0,
          color: AppColors.greyColorBottomTab,
        ),
        activeIconData: BottomBarItem(
          imgUrl: AppImage.leave,
          width: 22.0,
          color: AppColors.turquoiseColor,
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        child: Leave(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => AdaptiveBottomNavigationScaffold(
        key: NavigationService.instance.apdaterKey,
        navigationBarItems: appFlows
            .map(
              (flow) => BottomNavigationTab(
                bottomNavigationBarItem: BottomNavigationBarItem(
                  label: flow.title,
                  icon: flow.iconData,
                  activeIcon: flow.activeIconData,
                ),
                navigatorKey: flow.navigatorKey,
                initialPageBuilder: (context) => flow.child,
              ),
            )
            .toList(),
      );
}
