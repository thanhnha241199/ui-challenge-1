import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
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
              margin:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text("")),
                      Expanded(
                          flex: 5,
                          child: Text(
                            AppTranslations()
                                .getLanguage(context, 'updatePassword'),
                            style: AppTextStyles.textSize20(
                                fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppMetrics.paddingVertical),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: widget.controllerPassword,
                          decoration: InputDecoration(
                            labelText: AppTranslations()
                                .getLanguage(context, 'currentPassword'),
                            suffixIcon: widget.obscureCurrent
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureCurrent =
                                            !widget.obscureCurrent;
                                      });
                                    },
                                    child: Icon(Icons.visibility_off),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureCurrent =
                                            !widget.obscureCurrent;
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                          obscureText: !widget.obscureCurrent,
                        ),
                        SizedBox(
                          height: AppMetrics.paddingContainer,
                        ),
                        TextField(
                          controller: widget.controllerNewPassword,
                          decoration: InputDecoration(
                            labelText: AppTranslations()
                                .getLanguage(context, 'newPassword'),
                            suffixIcon: widget.obscureNew
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureNew = !widget.obscureNew;
                                      });
                                    },
                                    child: Icon(Icons.visibility_off),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureNew = !widget.obscureNew;
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                          obscureText: !widget.obscureNew,
                        ),
                        SizedBox(
                          height: AppMetrics.paddingContainer,
                        ),
                        TextFormField(
                          controller: widget.controllerConfirmNewPassword,
                          decoration: InputDecoration(
                            labelText: AppTranslations()
                                .getLanguage(context, 'confirmPassword'),
                            suffixIcon: widget.obscureConfirm
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureConfirm =
                                            !widget.obscureConfirm;
                                      });
                                    },
                                    child: Icon(Icons.visibility_off),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureConfirm =
                                            !widget.obscureConfirm;
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                          obscureText: !widget.obscureConfirm,
                        )
                      ],
                    ),
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
