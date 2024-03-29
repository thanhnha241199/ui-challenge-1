import 'dart:math';
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
  Animation<Color> buttonColor;
  Animation<double> animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250))
          ..addListener(() {
            setState(() {});
          });
    animateIcon =
        Tween<double>(begin: 0, end: 3 / 4 * pi).animate(_animationController);
    buttonColor = ColorTween(
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
        1.0,
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
    setState(() {
      isOpened = !isOpened;
    });
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
                  -_translateButton.value,
                  0.0,
                  0.0,
                ),
                child: item(
                    AppTranslations().getLanguage(context, 'newTimecard'),
                    AppImage.newtimecard, () {
                  NavigationService.instance.navigateTo(NewTimeCard());
                })),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  -_translateButton.value,
                  0.0,
                  0.0,
                ),
                child: item(
                    AppTranslations().getLanguage(context, 'newTimesheet'),
                    AppImage.newtimesheet, () {
                  NavigationService.instance.navigateTo(NewTimeSheetDetail());
                })),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          if (isOpened)
            Transform(
              transform: Matrix4.translationValues(
                -_translateButton.value,
                0.0,
                0.0,
              ),
              child: item(
                  AppTranslations().getLanguage(context, 'requestLeave'),
                  AppImage.clock, () {
                NavigationService.instance.navigateTo(NewLeaveRequest());
              }),
            ),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          Theme.of(context).brightness == Brightness.dark
              ? toggle(AppImage.floatbtn_dart)
              : toggle(AppImage.floatbtn)
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
        margin: EdgeInsets.only(right: 10.0),
        padding: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingVerticalContainer,
            vertical: AppMetrics.paddingContent),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.border),
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

  Widget toggle(String icon) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform.rotate(
          angle: animateIcon.value,
          child:
              GestureDetector(onTap: animate, child: SvgPicture.asset(icon))),
    );
  }
}
