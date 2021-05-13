import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      style: AppTextStyles.textSize31(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.black),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        "${AppTranslations().getLanguage(context, 'of')} 40.0 h",
                        style: AppTextStyles.textSize14(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.greyColor)),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      AppTranslations().getLanguage(context, 'scheduled'),
                      style: AppTextStyles.textSize14(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.greyColor),
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
}
