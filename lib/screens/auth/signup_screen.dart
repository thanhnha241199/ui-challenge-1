import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/auth/login_screen.dart';
import 'package:bookkeepa/screens/auth/verify_code_screen.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/bottom_space.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_dialog.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controllerEmail, controllerPhone;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: 'jerrysmith@gmail.com');
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
        appBar: HeaderView(),
        body: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
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
                                  SvgPicture.asset(AppImage.logo),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    AppTranslations()
                                        .getLanguage(context, 'Sign Up'),
                                    style: AppTextStyles.textSize25(
                                        fontWeight: FontWeight.bold),
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
                                    title: AppTranslations()
                                        .getLanguage(context, 'Email'),
                                    textInputAction: TextInputAction.done,
                                    controller: controllerEmail,
                                    icon: Icons.check_circle_outline_outlined),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InputField(
                                        title: AppTranslations()
                                            .getLanguage(context, '+61'),
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: InputField(
                                        title: AppTranslations().getLanguage(
                                            context, '0412 345 678'),
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      flex: 1),
                  Column(
                    children: [
                      CustomButton(
                        height: MediaQuery.of(context).size.height * 0.08,
                        ontap: () {
                          NavigationService.instance.navigateTo(VerifyCode());
                        },
                        borderColor: AppColors.greenAccent,
                        color: AppColors.greenAccent,
                        text:
                            AppTranslations().getLanguage(context, 'Register'),
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
                                'Already registered?',
                                style: AppTextStyles.textSize14(),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  NavigationService.instance
                                      .navigateTo(Login());
                                },
                                child: Text('Login',
                                    style: AppTextStyles.textSize14(
                                      color: AppColors.green,
                                    )),
                              )
                            ],
                          )),
                    ],
                  ),
                  BottomSpace(),
                ],
              ),
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
