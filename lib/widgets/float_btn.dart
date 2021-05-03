import 'dart:ui';

import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/dashboard/new_time_card.dart';
import 'package:bookkeepa/screens/dashboard/select_business.dart';
import 'package:bookkeepa/screens/leave/new_leave_request.dart';
import 'package:bookkeepa/screens/timesheets/new_timesheet.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final bool switchAccount;
  FancyFab(
      {this.onPressed, this.tooltip, this.icon, @required this.switchAccount});

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
          if (isOpened && widget.switchAccount)
            Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 180.0),
              child: CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal),
                padding:
                    EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
                colorBorder: AppColors.grey.withOpacity(0.2),
                child: GestureDetector(
                  onTap: () {
                    NavigationService.instance.navigateTo(SelectBusiness());
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.storefront,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Switch to Anothe Bussiness",
                              style: AppTextStyles.textSize16(),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppImage.arrowforward,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 3.0,
                  0.0,
                ),
                child: newTimecard()),
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 2.0,
                  0.0,
                ),
                child: newTimesheet()),
          if (isOpened)
            Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value,
                  0.0,
                ),
                child: requestLeave()),
          toggle(),
        ],
      ),
    );
  }

  Widget newTimecard() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo(NewTimeCard());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.46,
        padding: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingContent),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppTranslations().getLanguage(context, 'newTimecard'),
              style: AppTextStyles.textSize16(color: AppColors.green),
            ),
            SizedBox(
              width: 10.0,
            ),
            SvgPicture.asset(AppImage.newtimecard)
          ],
        ),
      ),
    );
  }

  Widget newTimesheet() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo(NewTimeSheetDetail());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.46,
        padding: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingContent),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppTranslations().getLanguage(context, 'newTimesheet'),
              style: AppTextStyles.textSize16(color: AppColors.green),
            ),
            SizedBox(
              width: 10.0,
            ),
            SvgPicture.asset(AppImage.newtimesheet)
          ],
        ),
      ),
    );
  }

  Widget requestLeave() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo(NewLeaveRequest());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.46,
        padding: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingContent),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppTranslations().getLanguage(context, 'requestLeave'),
              style: AppTextStyles.textSize16(color: AppColors.green),
            ),
            SizedBox(
              width: 10.0,
            ),
            SvgPicture.asset(AppImage.clock)
          ],
        ),
      ),
    );
  }

  Widget toggle() {
    return isOpened
        ? Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value,
              0.0,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                  onTap: animate, child: SvgPicture.asset(AppImage.close_fab)),
            ))
        : Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value,
              0.0,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 60.0),
              child: GestureDetector(
                  onTap: animate, child: SvgPicture.asset(AppImage.floatbtn)),
            ));
  }
}
