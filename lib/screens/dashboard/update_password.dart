import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class UpdatePassword extends StatefulWidget {
  TextEditingController controllerPassword,
      controllerNewPassword,
      controllerConfirmNewPassword;
  bool obscureCurrent, obscureNew, obscureConfirm;
  UpdatePassword(
      {this.controllerPassword,
      this.controllerNewPassword,
      this.controllerConfirmNewPassword,
      this.obscureNew,
      this.obscureConfirm,
      this.obscureCurrent});
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(flex: 2, child: Text("")),
                        Expanded(
                            flex: 5,
                            child: Text(
                              AppTranslations()
                                  .getLanguage(context, 'updatePassword'),
                              style: AppTextStyles.textSize20(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.black),
                            )),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  AppImage.close,
                                  alignment: Alignment.center,
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        title: AppTranslations()
                            .getLanguage(context, 'currentPassword'),
                        hinttitle: AppTranslations()
                            .getLanguage(context, 'currentPassword'),
                        style: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                        textStyleHint: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        textStyle: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.colorText
                                    : AppColors.blueLight),
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        controller: widget.controllerPassword,
                        icon: Icons.visibility_off,
                      ),
                      InputField(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        title: AppTranslations()
                            .getLanguage(context, 'newPassword'),
                        hinttitle: AppTranslations()
                            .getLanguage(context, 'newPassword'),
                        style: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                        textStyleHint: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        textStyle: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.colorText
                                    : AppColors.blueLight),
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        controller: widget.controllerNewPassword,
                        icon: Icons.visibility_off,
                      ),
                      InputField(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        title: AppTranslations()
                            .getLanguage(context, 'confirmPassword'),
                        hinttitle: AppTranslations()
                            .getLanguage(context, 'confirmPassword'),
                        style: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                        textStyleHint: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        textStyle: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.colorText
                                    : AppColors.blueLight),
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        controller: widget.controllerConfirmNewPassword,
                        icon: Icons.visibility_off,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppMetrics.paddingVertical,
                  horizontal: AppMetrics.paddingHorizotal),
              child: CustomButton(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                ontap: () {},
                borderColor: AppColors.greenAccent,
                color: AppColors.greenAccent,
                text: AppTranslations().getLanguage(context, 'save'),
                style: AppTextStyles.textSize14(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
