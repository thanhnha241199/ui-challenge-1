import 'dart:ui';

import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/dashboard/new_time_card.dart';
import 'package:bookkeepa/screens/leave/new_leave_request.dart';
import 'package:bookkeepa/screens/timesheets/new_timesheet.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: isOpened ? 8 : 0, sigmaY: isOpened ? 8 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 3.0,
                  0.0,
                ),
                child: item(
                    AppTranslations().getLanguage(context, 'newTimecard'),
                    AppImage.newtimecard, () {
                  NavigationService.instance.navigateTo(NewTimeCard());
                })),
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 2.0,
                  0.0,
                ),
                child: item(
                    AppTranslations().getLanguage(context, 'newTimesheet'),
                    AppImage.newtimesheet, () {
                  NavigationService.instance.navigateTo(NewTimeSheetDetail());
                })),
          if (isOpened)
            Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value,
                0.0,
              ),
              child: item(
                  AppTranslations().getLanguage(context, 'requestLeave'),
                  AppImage.clock, () {
                NavigationService.instance.navigateTo(NewLeaveRequest());
              }),
            ),
          toggle(),
        ],
      ),
    );
  }

  Widget item(String title, String icon, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55.0,
        width: 185.0,
        padding: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingVerticalContainer,
            vertical: AppMetrics.paddingContent),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: AppTextStyles.textSize16(color: AppColors.green),
            ),
            SizedBox(
              width: 10.0,
            ),
            SvgPicture.asset(icon)
          ],
        ),
      ),
    );
  }

  Widget toggle() {
    return isOpened
        ? Transform.rotate(
            angle: 45 * math.pi / 180,
            child: GestureDetector(
                onTap: animate, child: SvgPicture.asset(AppImage.floatbtn)),
          )
        : Transform.rotate(
            angle: 180 * math.pi / 180,
            child: Container(
              child: GestureDetector(
                  onTap: animate, child: SvgPicture.asset(AppImage.floatbtn)),
            ));
  }
}
