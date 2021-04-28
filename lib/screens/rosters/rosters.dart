import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';

class Rosters extends StatefulWidget {
  @override
  _RostersState createState() => _RostersState();
}

class _RostersState extends State<Rosters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("")),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppMetrics.paddingContainer),
                    child: Text(
                      "My ${AppTranslations().getLanguage(context, 'rosters')}",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  AppImage.notification,
                  alignment: Alignment.center,
                  height: 21.0,
                  width: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImage.arrowcircleleft,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Apr 4 -Apr 12 2021",
                  style: AppTextStyles.textSize16(),
                ),
                SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                  AppImage.arrowcircleright,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wesnesday, 4th April 2021",
                  style: AppTextStyles.textSize14(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomContainer(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal,
                      vertical: AppMetrics.paddingVertical),
                  width: MediaQuery.of(context).size.width * 0.8,
                  colorBorder: AppColors.grey.withOpacity(0.2),
                  child: Text(
                    "09:00ap to 12:00pm",
                    style: AppTextStyles.textSize16(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Thursday, 5th April 2021",
                  style: AppTextStyles.textSize14(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomContainer(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal,
                      vertical: AppMetrics.paddingVertical),
                  colorBorder: AppColors.grey.withOpacity(0.2),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.calendar,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "This is today",
                        style: AppTextStyles.textSize14(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomContainer(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal,
                      vertical: AppMetrics.paddingVertical),
                  width: MediaQuery.of(context).size.width,
                  colorBorder: AppColors.grey.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "09:00am to 12:00pm",
                        style: AppTextStyles.textSize16(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomButton(
                        ontap: () {},
                        borderColor: AppColors.greenAccent,
                        color: AppColors.greenAccent,
                        text: AppTranslations().getLanguage(context, 'clockin'),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        style: AppTextStyles.textSize16(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomContainer(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal,
                        vertical: AppMetrics.paddingVertical),
                    width: MediaQuery.of(context).size.width,
                    colorBorder: AppColors.grey.withOpacity(0.2),
                    child: Text(
                      "01:00pm to 05:00pm",
                      style: AppTextStyles.textSize16(),
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }
}
