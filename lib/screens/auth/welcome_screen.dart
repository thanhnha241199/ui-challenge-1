import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/onboarding/onboarding.dart';
import 'package:bookkeepa/screens/auth/login_screen.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final List<OnboadingModel> imgList = [
      OnboadingModel(
          image: 'assets/images/svg/onboarding.png',
          title: AppTranslations().getLanguage(context, 'title1'),
          subtitle: AppTranslations().getLanguage(context, 'subtitle1')),
      OnboadingModel(
          image: 'assets/images/svg/onboarding2.png',
          title: AppTranslations().getLanguage(context, 'title2'),
          subtitle: AppTranslations().getLanguage(context, 'subtitle2')),
      OnboadingModel(
          image: 'assets/images/svg/onboarding3.png',
          title: AppTranslations().getLanguage(context, 'title3'),
          subtitle: AppTranslations().getLanguage(context, 'subtitle3')),
      OnboadingModel(
          image: 'assets/images/svg/onboarding4.png',
          title: AppTranslations().getLanguage(context, 'title4'),
          subtitle: AppTranslations().getLanguage(context, 'subtitle4'))
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ))
        .toList();

    final double height = MediaQuery.of(context).size.height;
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            height: height * 0.4,
                            //  autoPlay: true,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            imgList[_current].title,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textSize31(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            imgList[_current].subtitle,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textSize16(),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Column(
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? AppColors.greenAccent
                                      : AppColors.grey,
                                ),
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal,
                      vertical: AppMetrics.paddingVertical),
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
                        height: 10.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _current = 3;
                          });
                        },
                        child: Text(
                          AppTranslations().getLanguage(context, 'skip'),
                          style:
                              AppTextStyles.textSize16(color: AppColors.green),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}
