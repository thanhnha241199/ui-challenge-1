import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/screens/dashboard/account.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 94.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
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
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.welcome),
                        SizedBox(
                          width: 10.0,
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
                    child: SvgPicture.asset(
                      AppImage.notification,
                      alignment: Alignment.center,
                    ))
              ],
            ),
          )),
      body: Column(
        children: [
          Expanded(flex: 7, child: circletime()),
          Expanded(flex: 4, child: scheduleroster()),
          Expanded(flex: 5, child: total())
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }

  Widget circletime() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingVertical),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              AppTranslations().getLanguage(context, 'hoursworkedthisweek'),
              style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SizedBox(
            height: 5.0,
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
        ],
      ),
    );
  }

  Widget scheduleroster() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
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
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
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
                    text: AppTranslations().getLanguage(context, 'clockin'),
                    height: MediaQuery.of(context).size.height * 0.05,
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
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
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
