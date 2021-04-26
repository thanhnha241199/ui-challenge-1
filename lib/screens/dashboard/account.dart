import 'dart:ui';

import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/dashboard/profile.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_metrics.dart';
import '../../widgets/header_view.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 94.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingVertical),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text("")),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Account",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: '',
                        barrierColor: Colors.black38,
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                          title: Text('blured background'),
                          content: Text(
                              'background should be blured and little bit darker '),
                          elevation: 2,
                          actions: [
                            MaterialButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        transitionBuilder: (ctx, anim1, anim2, child) =>
                            BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                          child: FadeTransition(
                            child: child,
                            opacity: anim1,
                          ),
                        ),
                        context: context,
                      );
                    },
                    child: SvgPicture.asset(
                      AppImage.notification,
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ),
          )),
      body: ListView(
        children: [
          profile(),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.storefront,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Switch to Anothe Bussiness",
                            style: AppTextStyles.textSize16(),
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
              ],
            ),
          ),
          CustomContainer(
            edgeInsets: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.toggleright,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Notification Preferences",
                            style: AppTextStyles.textSize16(),
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
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppMetrics.paddingHorizotal),
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 2, child: Text("")),
                                      Expanded(
                                          flex: 5,
                                          child: Text(
                                            "Update Password",
                                            style: AppTextStyles.textSize20(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                              onTap: () {
                                                NavigationService.instance
                                                    .goback();
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.close,
                                                alignment: Alignment.center,
                                              )))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppMetrics.paddingHorizotal,
                                        vertical: AppMetrics.paddingVertical),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                              labelText: 'Current password',
                                              suffixIcon: SvgPicture.asset(
                                                AppImage.eyeslash,
                                                height: 4.0,
                                                width: 4.0,
                                              )),
                                          obscureText: true,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              labelText: 'New password',
                                              suffixIcon: SvgPicture.asset(
                                                AppImage.eyeslash,
                                                height: 4.0,
                                                width: 4.0,
                                              )),
                                          obscureText: true,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              labelText: 'Confirm new password',
                                              suffixIcon: SvgPicture.asset(
                                                AppImage.eyeslash,
                                                height: 4.0,
                                                width: 4.0,
                                              )),
                                          obscureText: true,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CustomButton(
                                    ontap: () {
                                      NavigationService.instance.goback();
                                    },
                                    color: AppColors.greenAccent,
                                    text: "Close",
                                    style: AppTextStyles.textSize14(),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.key,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Update Password",
                              style: AppTextStyles.textSize16(),
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
              ],
            ),
          ),
          CustomContainer(
            edgeInsets: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingContent),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizotal,
                      vertical: AppMetrics.paddingContent),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.support,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Support",
                            style: AppTextStyles.textSize16(),
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
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.privacy,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Privacy Policy",
                            style: AppTextStyles.textSize16(),
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
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.logout,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Log out",
                            style: AppTextStyles.textSize16(),
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
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }

  Widget profile() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          vertical: AppMetrics.paddingHorizotal,
          horizontal: AppMetrics.paddingVertical),
      child: GestureDetector(
        onTap: () {
          NavigationService.instance.navigateTo(ProfileScreen());
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
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lucas Flalonia",
                        style: AppTextStyles.textSize18(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "lucasflatonia@gmail.com",
                        style: AppTextStyles.textSize14(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "+61 342 554 321",
                        style: AppTextStyles.textSize14(),
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
