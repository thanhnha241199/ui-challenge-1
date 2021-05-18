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
import 'package:bookkeepa/widgets/custom_dialog.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controllerEmail, controllerPhone, controllerPassword;
  PhoneNumber number = PhoneNumber(isoCode: 'AU');
  FocusNode fnEmail, fnPassword;

  @override
  void initState() {
    super.initState();
    fnPassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    fnEmail?.dispose();
    controllerEmail?.dispose();
    fnPassword?.dispose();
    controllerPassword?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != '') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  descriptions: 'zxczcx',
                  title: 'error',
                );
              });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImage.logo,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.colorText
                                    : null,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                AppTranslations()
                                    .getLanguage(context, 'signUp'),
                                style: AppTextStyles.textSize25(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            InputField(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppMetrics.paddingHorizotal),
                                focusNode: fnEmail,
                                title: AppTranslations()
                                    .getLanguage(context, 'email'),
                                hinttitle: AppTranslations()
                                    .getLanguage(context, 'email'),
                                style: AppTextStyles.textSize18(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                                textStyleHint: AppTextStyles.textSize18(
                                    color: AppColors.blueLight),
                                textStyle: AppTextStyles.textSize18(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.colorText
                                        : AppColors.blueLight),
                                textInputAction: TextInputAction.done,
                                controller: controllerEmail,
                                icon: Icons.check_circle),
                            InputField(
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              focusNode: fnPassword,
                              title: AppTranslations()
                                  .getLanguage(context, 'password'),
                              hinttitle: AppTranslations()
                                  .getLanguage(context, 'password'),
                              style: AppTextStyles.textSize18(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.black),
                              textStyleHint: AppTextStyles.textSize18(
                                  color: AppColors.blueLight),
                              textStyle: AppTextStyles.textSize18(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.colorText
                                      : AppColors.blueLight),
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              controller: controllerPassword,
                              icon: Icons.visibility_off,
                            ),
                            SizedBox(
                              height: AppMetrics.paddingContainer,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: AppMetrics.paddingHorizotal,
                                  right: AppMetrics.paddingHorizotal),
                              alignment: Alignment.center,
                              child: InternationalPhoneNumberInput(
                                textStyle: AppTextStyles.textSize18(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.blueLight),
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.DIALOG),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: AppTextStyles.textSize18(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.blueLight),
                                initialValue: number,
                                textFieldController: controllerPhone,
                                formatInput: false,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                inputDecoration: InputDecoration(
                                  hintText: '0412 345 678',
                                  hintStyle: AppTextStyles.textSize18(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.whiteColor
                                          : AppColors.blueLight),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.grey10),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.greenAccent),
                                  ),
                                ),
                                onSaved: (PhoneNumber number) {
                                  print('On Saved: $number');
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal),
                  child: Column(
                    children: [
                      CustomButton(
                        height: MediaQuery.of(context).size.height * 0.08,
                        ontap: () {
                          context.read<AuthBloc>().add(AuthSignUp(
                              registerId: controllerEmail.text,
                              phoneNumber: controllerPhone.text,
                              password: controllerPassword.text));
                        },
                        borderColor: AppColors.greenAccent,
                        color: AppColors.greenAccent,
                        text:
                            AppTranslations().getLanguage(context, 'register'),
                        style: AppTextStyles.textSize18(),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMetrics.paddingHorizotal,
                              vertical: AppMetrics.paddingVertical),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppTranslations()
                                    .getLanguage(context, 'alreadyRegisterd'),
                                style: AppTextStyles.textSize14(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.greyColor),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  NavigationService.instance
                                      .navigateTo(Login());
                                },
                                child: Text(
                                    AppTranslations()
                                        .getLanguage(context, 'login'),
                                    style: AppTextStyles.textSize14(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.colorText
                                          : AppColors.green,
                                    )),
                              )
                            ],
                          )),
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
    );
  }
}
