import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_metrics.dart';
import '../../util/navigator_serivce.dart';
import '../../widgets/header_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 90.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.instance.goback();
                      },
                      child: SvgPicture.asset(
                        AppImage.arrow_back,
                        height: 21.0,
                        width: 11.0,
                      ),
                    )),
                Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTranslations().getLanguage(context, 'editprofile'),
                          style: AppTextStyles.textSize16(),
                        )
                      ],
                    )),
                Expanded(flex: 1, child: Text(''))
              ],
            ),
          )),
      body: Column(
        children: [
          Column(
            children: [
              CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    vertical: AppMetrics.paddingVertical,
                    horizontal: AppMetrics.paddingHorizotal),
                colorBorder: AppColors.grey.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingVertical,
                      horizontal: AppMetrics.paddingHorizotal),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AppImage.avatar,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            AppTranslations().getLanguage(context, 'editphoto'),
                            style: AppTextStyles.textSize18(
                                color: AppColors.green),
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
              CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal),
                padding:
                    EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
                colorBorder: AppColors.grey.withOpacity(0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        alignment: Alignment.center,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Jerry Smith',
                              labelText: 'Full Name',
                              hintStyle: AppTextStyles.textSize18(
                                  color: AppColors.grey),
                              labelStyle: AppTextStyles.textSize12(
                                  color: AppColors.grey)),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'jerrysmith@gmail.com',
                              hintStyle: AppTextStyles.textSize18(
                                  color: AppColors.grey),
                              labelStyle: AppTextStyles.textSize12(
                                  color: AppColors.grey)),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: '+61',
                                    labelText: 'Phone number',
                                    hintStyle: AppTextStyles.textSize18(
                                        color: AppColors.grey),
                                    labelStyle: AppTextStyles.textSize12(
                                        color: AppColors.grey)),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              flex: 4,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: '0412 345 678',
                                    labelText: '',
                                    hintStyle: AppTextStyles.textSize18(
                                        color: AppColors.grey),
                                    labelStyle: AppTextStyles.textSize12(
                                        color: AppColors.grey)),
                              ),
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        alignment: Alignment.center,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Mo works',
                              labelText: 'Employer',
                              hintStyle: AppTextStyles.textSize18(
                                  color: AppColors.grey),
                              labelStyle: AppTextStyles.textSize12(
                                  color: AppColors.grey)),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    ontap: () {},
                    color: AppColors.greenAccent,
                    text: "Save Changes",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance.goback();
                    },
                    color: AppColors.whiteColor,
                    text: "Cancel",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
