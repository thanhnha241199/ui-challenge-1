import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/account/user_profile.dart';
import 'package:bookkeepa/screens/dashboard/profile.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  final UserProfileModel userProfileModel;
  Profile({this.userProfileModel});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
      padding: EdgeInsets.symmetric(horizontal: AppMetrics.paddingContent),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black300
          : AppColors.whiteColor,
      colorBorder: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black300
          : AppColors.border,
      child: GestureDetector(
        onTap: () {
          NavigationService.instance
              .navigateTo(ProfileScreen(userProfileModel: userProfileModel));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: AppMetrics.paddingHorizotal,
              horizontal: AppMetrics.paddingContent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      userProfileModel.image != null
                          ? userProfileModel.image
                          : AppImage.avatar,
                    ),
                  ),
                  SizedBox(
                    width: AppMetrics.paddingContainer,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userProfileModel.firstName} ${userProfileModel.lastName}",
                        style: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        userProfileModel.email,
                        style: AppTextStyles.textSize14(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.greyColor),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        userProfileModel.phone,
                        style: AppTextStyles.textSize14(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.greyColor),
                      ),
                    ],
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
    );
  }
}
