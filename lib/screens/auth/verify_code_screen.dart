import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/auth/login_screen.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/bottom_space.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCode extends StatefulWidget {
  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController controllerPassword;
  FocusNode fnPassword;
  @override
  void initState() {
    super.initState();
    fnPassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    fnPassword.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthPinCode = (width - (AppMetrics.paddingHorizotal * 2)) / 7;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: HeaderView(
          color: AppColors.whiteColor,
          child: HeaderChild(
              leftIcon: SvgPicture.asset(AppImage.arrow_back),
              title: AppTranslations().getLanguage(context, 'verifyNumber'),
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black)),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMetrics.paddingHorizotal),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 150.0,
                              ),
                              Text(
                                '${AppTranslations().getLanguage(context, 'verifyPhone')} \n+61 0412 345 678',
                                style: AppTextStyles.textSize16(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 24.0,
                              ),
                              PinCodeTextField(
                                appContext: context,
                                length: 6,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                textStyle: AppTextStyles.textSize25(),
                                validator: (v) {
                                  // if (v!.length < 3) {
                                  //   return "I'm from validator";
                                  // } else {
                                  return null;
                                  // }
                                },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(
                                        AppMetrics.borderContainer),
                                    fieldHeight: widthPinCode,
                                    fieldWidth: widthPinCode,
                                    inactiveFillColor: AppColors.whiteColor,
                                    inactiveColor: AppColors.whiteColor,
                                    selectedFillColor: AppColors.whiteColor,
                                    selectedColor: AppColors.greenAccent,
                                    activeFillColor: AppColors.whiteColor,
                                    activeColor: AppColors.whiteColor),
                                cursorColor: AppColors.greenAccent,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                // errorAnimationController: errorController,
                                // controller: textEditingController,
                                keyboardType: TextInputType.number,
                                boxShadows: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 2,
                                  )
                                ],
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    // currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppTranslations()
                                        .getLanguage(context, 'notCode'),
                                    style: AppTextStyles.textSize14(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.whiteColor
                                            : AppColors.blueLight),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    AppTranslations()
                                        .getLanguage(context, 'resendCode'),
                                    style: AppTextStyles.textSize14(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.colorText
                                            : AppColors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal),
                    child: Column(
                      children: [
                        CustomButton(
                          height: MediaQuery.of(context).size.height * 0.08,
                          ontap: () {
                            NavigationService.instance.navigateTo(Login());
                          },
                          borderColor: AppColors.greenAccent,
                          color: AppColors.greenAccent,
                          text: AppTranslations().getLanguage(context, 'next'),
                          style: AppTextStyles.textSize18(),
                        ),
                        SizedBox(
                          height: 24.0,
                        )
                      ],
                    ),
                  ),
                  BottomSpace(),
                ],
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state.requesting) return OverlayLoading();
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
