import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/dashboard/time_card.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';

class ScheduleRoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              style: AppTextStyles.textSize16(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
            ),
          ),
          Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.dividerDark
                : AppColors.divider,
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
                    style: AppTextStyles.textSize16(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
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
}
