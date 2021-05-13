import 'dart:ui';

import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/screens/dashboard/account.dart';
import 'package:bookkeepa/screens/dashboard/widgets/circle_time.dart';
import 'package:bookkeepa/screens/dashboard/widgets/schedule_roster.dart';
import 'package:bookkeepa/screens/dashboard/widgets/total.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_vew_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';
import '../../util/navigator_serivce.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 250.0,
            color: Colors.black,
            child: SvgPicture.asset(
              AppImage.background,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: HeaderView(
                height: 90.0,
                color: Colors.transparent,
                child: HeaderChild(
                  leftIcon: GestureDetector(
                      onTap: () {
                        NavigationService.instance
                            .pushPage(context, true, AccountScreen());
                      },
                      child: Image.asset(AppImage.avatar_dashboard)),
                  title:
                      "${AppTranslations().getLanguage(context, 'welcome')} Lucas",
                  style: AppTextStyles.textSize20(color: AppColors.whiteColor),
                  rightIcon: GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: '',
                          barrierColor: Colors.black38,
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (ctx, anim1, anim2) {
                            return Notifications();
                          },
                          transitionBuilder: (ctx, anim1, anim2, child) =>
                              BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 30 * anim1.value,
                                sigmaY: 30 * anim1.value),
                            child: FadeTransition(
                              child: child,
                              opacity: anim1,
                            ),
                          ),
                          context: context,
                        );
                      },
                      child: SvgPicture.asset(
                        AppImage.notification,
                        color: AppColors.whiteColor,
                      )),
                )),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CircleTime(),
                  SizedBox(
                    height: 8.0,
                  ),
                  ScheduleRoster(),
                  SizedBox(
                    height: 8.0,
                  ),
                  Total(),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FancyFab(),
    );
  }
}
