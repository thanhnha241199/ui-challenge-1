import 'dart:ui';

import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/screens/dashboard/account.dart';
import 'package:bookkeepa/screens/dashboard/new_time_card.dart';
import 'package:bookkeepa/screens/dashboard/time_card.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
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
  List<NotificationModel> items = [
    NotificationModel(
        title: "Jack Hihnson requested leave", read: true, time: "1m ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: true,
        time: "20m ago"),
    NotificationModel(
        title: "1 document needs to be signed", read: false, time: "1h ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: false,
        time: "5h ago"),
    NotificationModel(
        title: "Cornor Halt requested leave", read: false, time: "10h ago"),
    NotificationModel(
        title: "Joseph Rosso needs timesheet approved",
        read: false,
        time: "1d ago"),
    NotificationModel(
        title: "3 documents needs to be signed", read: false, time: "1d ago"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.instance
                            .pushPage(context, true, AccountScreen());
                      },
                      child: SvgPicture.asset(
                        AppImage.user,
                        alignment: Alignment.center,
                        height: 21.0,
                        width: 20.0,
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.welcome),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${AppTranslations().getLanguage(context, 'hi')} Lucas",
                          style: AppTextStyles.textSize20(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: '',
                          barrierColor: Colors.black38,
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (ctx, anim1, anim2) {
                            return Notifications(
                              items: items,
                            );
                          },
                          transitionBuilder: (ctx, anim1, anim2, child) =>
                              FadeTransition(
                            child: child,
                            opacity: anim1,
                          ),
                          context: context,
                        );
                      },
                      child: SvgPicture.asset(
                        AppImage.notification,
                        alignment: Alignment.center,
                        height: 21.0,
                        width: 20.0,
                      ),
                    ))
              ],
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [circletime(), scheduleroster(), total()],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          NavigationService.instance.pushPage(context, false, NewTimeCard());
        },
        child: SvgPicture.asset(
          AppImage.floatbtn,
        ),
      ),
    );
  }

  Widget circletime() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingVertical),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      colorBorder: AppColors.grey.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            child: Text(
              AppTranslations().getLanguage(context, 'hoursworkedthisweek'),
              style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SizedBox(
            height: 22.0,
          ),
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
                      "of 40.0 h",
                      style: AppTextStyles.textSize14(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Scheduled",
                      style: AppTextStyles.textSize14(),
                    )
                  ],
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: AppColors.greenAccent,
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
        ],
      ),
    );
  }

  Widget scheduleroster() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      colorBorder: AppColors.grey.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            child: Text(
              AppTranslations().getLanguage(context, 'scheduleroster'),
              style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "09:00am to 12:00pm",
                    style: AppTextStyles.textSize16(),
                  ),
                  SizedBox(
                    height: 20.0,
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
          right: AppMetrics.paddingHorizotal,
          top: AppMetrics.paddingVertical,
          bottom: AppMetrics.paddingContent),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      colorBorder: AppColors.grey.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalytd'),
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
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalpayg'),
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
          Divider(),
          Container(
            padding: EdgeInsets.only(
                left: AppMetrics.paddingHorizotal,
                right: AppMetrics.paddingHorizotal,
                top: AppMetrics.paddingContent,
                bottom: AppMetrics.paddingHorizotal),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'totalnetpay'),
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
