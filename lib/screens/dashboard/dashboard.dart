import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/screens/dashboard/account.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 90.0,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            child: Row(
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
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.welcome,
                          alignment: Alignment.center,
                        ),
                        Text(
                          "Hi Sarah",
                          style: AppTextStyles.textSize20(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      AppImage.notification,
                      alignment: Alignment.center,
                    ))
              ],
            ),
          )),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingVertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        "Hours worked this week",
                        style: AppTextStyles.textSize16(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      child: CircularPercentIndicator(
                        radius: 150.0,
                        lineWidth: 10.0,
                        animation: true,
                        animationDuration: 3000,
                        percent: 0.6,
                        animateFromLastPercent: true,
                        center: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "7.0 h",
                                style: AppTextStyles.textSize31(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "of 40.0 h\nScheduled",
                                style: AppTextStyles.textSize16(),
                              )
                            ],
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.greenAccent,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal,
                          vertical: AppMetrics.paddingContent),
                      child: Text(
                        "Scheduled roster today",
                        style: AppTextStyles.textSize16(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
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
                              ontap: () {},
                              color: AppColors.greenAccent,
                              text: "Clock in",
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.3,
                              style: AppTextStyles.textSize14(),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingContent),
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
                            "Total Wages YTD",
                            style: AppTextStyles.textSize16(),
                          ),
                          Spacer(),
                          Text(
                            "\$20,100",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
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
                            "Total PAYG",
                            style: AppTextStyles.textSize16(),
                          ),
                          Spacer(),
                          Text(
                            "\$20,100",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
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
                            "Total Net Pay",
                            style: AppTextStyles.textSize16(),
                          ),
                          Spacer(),
                          Text(
                            "\$20,100",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }
}
