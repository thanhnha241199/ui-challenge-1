import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/auth/signup_screen.dart';
import 'package:bookkeepa/screens/main/main_tab.dart';
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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showpass = true;
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  FocusNode fnEmail, fnPassword;
  @override
  void initState() {
    super.initState();
    controllerEmail.text = "newt.employee@mailinator.com";
    controllerPassword.text = "fybahmay";
  }

  @override
  void dispose() {
    super.dispose();
    fnEmail?.dispose();
    fnPassword?.dispose();
    controllerEmail?.dispose();
    controllerPassword?.dispose();
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
                  title: 'Alerts',
                  descriptions: 'Incorrect email or password',
                );
              });
        }
      },
      child: Scaffold(
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
                                      ? AppColors.greenAccent
                                      : AppColors.black,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  AppTranslations()
                                      .getLanguage(context, 'welcomeBack'),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.0),
                                  validator: validateEmail,
                                  onEditingComplete: () {
                                    validateEmail(controllerEmail.text);
                                  },
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
                              SizedBox(
                                height: AppMetrics.paddingContainer,
                              ),
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
                                isPassword: showpass,
                                textInputAction: TextInputAction.done,
                                controller: controllerPassword,
                                icon: Icons.visibility_off,
                              ),
                              SizedBox(
                                height: AppMetrics.paddingContainer,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.0),
                                child: Text(
                                  AppTranslations()
                                      .getLanguage(context, 'forgotPassword'),
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.textSize14(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.colorText
                                          : AppColors.green),
                                ),
                              ),
                            ],
                          )
                        ],
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
                          context.read<AuthBloc>().add(AuthLogin(
                              phoneNumber: controllerEmail.text,
                              password: controllerPassword.text));
                          NavigationService.instance.navigateTo(MainTab());
                        },
                        borderColor: AppColors.greenAccent,
                        color: AppColors.greenAccent,
                        text: AppTranslations().getLanguage(context, 'login'),
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
                                    .getLanguage(context, 'newBookeepa'),
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
                                      .navigateTo(SignUp());
                                },
                                child: Text(
                                    AppTranslations()
                                        .getLanguage(context, 'registerNow'),
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

  void ontap() {
    setState(() {
      showpass = !showpass;
    });
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null) {
      print('Enter a valid email address');
      return 'Enter a valid email address';
    } else
      return null;
  }
}
