import 'dart:ui';

import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/screens/dashboard/profile.dart';
import 'package:bookkeepa/screens/dashboard/select_business.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/screens/dashboard/update_password.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
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
  bool obscureCurrent, obscureNew, obscureConfirm;
  @override
  void initState() {
    super.initState();
    obscureCurrent = false;
    obscureNew = false;
    obscureConfirm = false;
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
              title: AppTranslations().getLanguage(context, 'account'),
              style: AppTextStyles.textSize16(),
              rightIcon: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black38,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (ctx, anim1, anim2) {
                        return Notifications();
                      },
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 30 * anim1.value, sigmaY: 30 * anim1.value),
                        child: FadeTransition(
                          child: child,
                          opacity: anim1,
                        ),
                      ),
                      context: context,
                    );
                  },
                  child: SvgPicture.asset(AppImage.notification)),
            )),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            profile(),
            CustomContainer(
              edgeInsets:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              padding:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
              colorBorder: AppColors.border,
              child: GestureDetector(
                onTap: () {
                  NavigationService.instance.navigateTo(SelectBusiness());
                },
                child: Container(
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
                            AppTranslations()
                                .getLanguage(context, 'switchBussiness'),
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
              padding:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
              colorBorder: AppColors.border,
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
                          AppTranslations()
                              .getLanguage(context, 'notification'),
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
                          useRootNavigator: true,
                          builder: (BuildContext context) {
                            return UpdatePassword(
                              obscureNew: obscureNew,
                              obscureCurrent: obscureCurrent,
                              obscureConfirm: obscureConfirm,
                              controllerPassword: controllerPassword,
                              controllerNewPassword: controllerNewPassword,
                              controllerConfirmNewPassword:
                                  controllerConfirmNewPassword,
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
                            AppTranslations()
                                .getLanguage(context, 'updatePassword'),
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
                          AppTranslations()
                              .getLanguage(context, 'privacyPocicy'),
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
              padding:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
              colorBorder: AppColors.border,
              child: GestureDetector(
                onTap: () {
                  NavigationService.instance.navigateTo(SelectBusiness());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                        AppTranslations().getLanguage(context, 'logout'),
                        style: AppTextStyles.textSize16(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FancyFab());
  }

  Widget profile() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          vertical: AppMetrics.paddingHorizotal,
          horizontal: AppMetrics.paddingContainer),
      padding: EdgeInsets.symmetric(horizontal: AppMetrics.paddingContent),
      colorBorder: AppColors.border,
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
                        style: AppTextStyles.textSize14(
                            color: AppColors.greyColor),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "+61 342 554 321",
                        style: AppTextStyles.textSize14(
                            color: AppColors.greyColor),
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
