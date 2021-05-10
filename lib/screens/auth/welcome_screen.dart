import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/auth/login_screen.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              AppImage.onboarding,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: AppMetrics.paddingContainer,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppTranslations().getLanguage(context, 'title'),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textSize31(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
                SizedBox(
                  height: AppMetrics.paddingContainer,
                ),
                Text(
                  AppTranslations().getLanguage(context, 'subtitle'),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textSize16(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.black),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingVertical),
              child: CustomButton(
                height: MediaQuery.of(context).size.height * 0.08,
                ontap: () {
                  NavigationService.instance.navigateTo(Login());
                },
                borderColor: AppColors.greenAccent,
                color: AppColors.greenAccent,
                text: AppTranslations().getLanguage(context, 'next'),
                style: AppTextStyles.textSize18(),
              ),
            )
          ]),
        ));
  }
}
