import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  style: AppTextStyles.textSize16(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.dividerDark
                : AppColors.divider,
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
                  style: AppTextStyles.textSize16(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.dividerDark
                : AppColors.divider,
          ),
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
                  style: AppTextStyles.textSize16(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
                Spacer(),
                Text(
                  "\$20,100",
                  style: AppTextStyles.textSize16(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
