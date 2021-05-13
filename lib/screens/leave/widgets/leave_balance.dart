import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';

class LeaveBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        edgeInsets: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingVertical),
        padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContainer),
        colorBorder: AppColors.border,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContent),
              child: Text(
                AppTranslations().getLanguage(context, 'leaveBalance'),
                style: AppTextStyles.textSize14(
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
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppTranslations().getLanguage(
                          context,
                          'annualBalance',
                        ),
                        style: AppTextStyles.textSize16(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.greyColor),
                      ),
                      Spacer(),
                      Text(
                        "23.5 h",
                        style: AppTextStyles.textSize25(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                      ),
                    ],
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
              child: Row(
                children: [
                  Text(
                    AppTranslations().getLanguage(context, 'sickBalance'),
                    style: AppTextStyles.textSize16(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.greyColor),
                  ),
                  Spacer(),
                  Text(
                    "37.0 h",
                    style: AppTextStyles.textSize25(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
