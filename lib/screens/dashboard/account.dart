import 'dart:ui';

import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/screens/dashboard/profile.dart';
import 'package:bookkeepa/screens/dashboard/select_business.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_metrics.dart';
import '../../widgets/header_view.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<NotificationModel> items = [
    NotificationModel(
        title: "Jack Hihnson requested leave", read: true, time: "1m ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: true,
        time: "20m ago"),
    NotificationModel(
        title: "1 document needs to be signed", read: false, time: "1h ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: false,
        time: "5h ago"),
    NotificationModel(
        title: "Cornor Halt requested leave", read: false, time: "10h ago"),
    NotificationModel(
        title: "Joseph Rosso needs timesheet approved",
        read: false,
        time: "1d ago"),
    NotificationModel(
        title: "3 documents needs to be signed", read: false, time: "1d ago"),
  ];
  TextEditingController controllerPassword,
      controllerNewPassword,
      controllerConfirmNewPassword;
  FocusNode fnEmail, fnPassword;
  @override
  void initState() {
    super.initState();
    controllerPassword = TextEditingController(text: '12345678');
    controllerNewPassword = TextEditingController(text: '12345678');
    controllerConfirmNewPassword = TextEditingController(text: '12345678');
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    controllerPassword.dispose();
    controllerNewPassword.dispose();
    controllerConfirmNewPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: "Account",
              style: AppTextStyles.textSize16(),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          profile(),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            colorBorder: AppColors.grey.withOpacity(0.2),
            child: GestureDetector(
              onTap: () {
                NavigationService.instance.navigateTo(SelectBusiness());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
            ),
          ),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            colorBorder: AppColors.grey.withOpacity(0.2),
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
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Container(
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
                                                  Navigator.pop(context);
                                                },
                                                child: SvgPicture.asset(
                                                  AppImage.close,
                                                  alignment: Alignment.center,
                                                )))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppMetrics.paddingHorizotal,
                                          vertical: AppMetrics.paddingVertical),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            controller: controllerPassword,
                                            decoration: InputDecoration(
                                                labelText: 'Current password',
                                                suffixIcon:
                                                    Icon(Icons.remove_red_eye)),
                                            obscureText: true,
                                          ),
                                          TextField(
                                            controller: controllerNewPassword,
                                            decoration: InputDecoration(
                                                labelText: 'New password',
                                                suffixIcon:
                                                    Icon(Icons.remove_red_eye)),
                                            obscureText: true,
                                          ),
                                          TextField(
                                            controller:
                                                controllerConfirmNewPassword,
                                            decoration: InputDecoration(
                                                labelText:
                                                    'Confirm new password',
                                                suffixIcon: SvgPicture.asset(
                                                    AppImage.eyeslash)),
                                            obscureText: true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 20.0, right: 20),
                                      child: CustomButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        ontap: () {},
                                        borderColor: AppColors.greenAccent,
                                        color: AppColors.greenAccent,
                                        text: "Save",
                                        style: AppTextStyles.textSize14(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
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
                  ),
                ),
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
            colorBorder: AppColors.grey.withOpacity(0.2),
            child: GestureDetector(
              onTap: () {
                NavigationService.instance.navigateTo(SelectBusiness());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                alignment: Alignment.center,
                child: Row(
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
              ),
            ),
          ),
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
          horizontal: AppMetrics.paddingContainer),
      colorBorder: AppColors.grey.withOpacity(0.2),
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
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImage.avatar,
                    ),
                  ),
                  SizedBox(
                    width: AppMetrics.paddingContainer,
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
