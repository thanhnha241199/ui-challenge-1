import 'dart:ui';

import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/screens/dashboard/account.dart';
import 'package:bookkeepa/screens/dashboard/time_card.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      appBar: HeaderView(
          height: 90.0,
          color: Colors.black,
          child: HeaderChild(
            leftIcon: GestureDetector(
                onTap: () {
                  NavigationService.instance
                      .pushPage(context, true, AccountScreen());
                },
                child: Image.asset(AppImage.avatar_dashboard)),
            title: "${AppTranslations().getLanguage(context, 'welcome')} Lucas",
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
                          sigmaX: 30 * anim1.value, sigmaY: 30 * anim1.value),
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
      body: Stack(
        children: [
          Container(
            height: 150.0,
            color: Colors.black,
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              circletime(),
              SizedBox(
                height: 8.0,
              ),
              scheduleroster(),
              SizedBox(
                height: 8.0,
              ),
              total(),
              SizedBox(
                height: AppMetrics.paddingContainer,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FancyFab(),
    );
  }

  Widget circletime() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
      colorBorder: AppColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            child: Text(
              AppTranslations().getLanguage(context, 'hoursworkedthisweek'),
              style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: AppColors.divider,
          ),
          SizedBox(height: 26.0),
          Container(
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              radius: 170.0,
              lineWidth: 10.0,
              animation: true,
              animationDuration: 3000,
              percent: 0.6,
              animateFromLastPercent: true,
              center: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingVertical),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "7.0 h",
                      style:
                          AppTextStyles.textSize31(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${AppTranslations().getLanguage(context, 'of')} 40.0 h",
                      style:
                          AppTextStyles.textSize14(color: AppColors.greyColor),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      AppTranslations().getLanguage(context, 'scheduled'),
                      style:
                          AppTextStyles.textSize14(color: AppColors.greyColor),
                    )
                  ],
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: AppColors.greenAccent,
            ),
          ),
          SizedBox(height: AppMetrics.paddingHorizotal),
        ],
      ),
    );
  }

  Widget scheduleroster() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      colorBorder: AppColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            child: Text(
              AppTranslations().getLanguage(context, 'scheduleRoster'),
              style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: AppColors.divider,
          ),
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppMetrics.paddingContent,
                  ),
                  Text(
                    "09:00am to 12:00pm",
                    style: AppTextStyles.textSize16(),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingVerticalContainer,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance
                          .pushPage(context, false, TimeCard());
                    },
                    borderColor: AppColors.greenAccent,
                    color: AppColors.greenAccent,
                    text: AppTranslations().getLanguage(context, 'clockin'),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    style: AppTextStyles.textSize14(),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingVerticalContainer,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget total() {
    return CustomContainer(
      edgeInsets: EdgeInsets.only(
          left: AppMetrics.paddingHorizotal,
          right: AppMetrics.paddingHorizotal),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      colorBorder: AppColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalYtd'),
                  style: AppTextStyles.textSize16(),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.divider,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalPayg'),
                  style: AppTextStyles.textSize16(),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.divider),
          Container(
            padding: EdgeInsets.only(
                left: AppMetrics.paddingContainer,
                right: AppMetrics.paddingContainer,
                top: AppMetrics.paddingContent,
                bottom: AppMetrics.paddingContainer),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalNetpay'),
                  style: AppTextStyles.textSize16(),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
