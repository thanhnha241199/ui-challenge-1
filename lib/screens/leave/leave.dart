import 'dart:ui';

import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/screens/leave/edit_leave_request.dart';

import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';
import '../../util/navigator_serivce.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  List<NotificationModel> notification = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'myLeave'),
              style: AppTextStyles.textSize16(),
              rightIcon: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black38,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (ctx, anim1, anim2) {
                        return Notifications(
                          items: notification,
                        );
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
                  child: SvgPicture.asset(AppImage.notification)))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          leaveBalance(),
          CustomContainer(
              edgeInsets: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              colorBorder: AppColors.grey.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.pending,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SvgPicture.asset(
                                  AppImage.sick_leave,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Trip to Sydney",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                  AppImage.sick_leave,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.pending,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                  AppImage.sick_leave,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                  AppImage.sick_leave,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                  AppImage.sick_leave,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(
            ontap: () {
              NavigationService.instance.navigateTo(EditLeave());
            },
            borderColor: AppColors.greenAccent,
            color: AppColors.greenAccent,
            text: AppTranslations().getLanguage(context, 'requestLeave'),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.4,
            style: AppTextStyles.textSize14(),
          ),
          SizedBox(
            width: 20.0,
          ),
          FancyFab(
            switchAccount: false,
          )
        ],
      ),
    );
  }

  Widget leaveBalance() {
    return CustomContainer(
        edgeInsets: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingVertical),
        padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
        colorBorder: AppColors.grey.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                AppTranslations().getLanguage(context, 'leaveBalance'),
                style: AppTextStyles.textSize14(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppTranslations().getLanguage(context, 'annualBalance'),
                        style: AppTextStyles.textSize16(),
                      ),
                      Spacer(),
                      Text(
                        "23.5 h",
                        style: AppTextStyles.textSize25(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    AppTranslations().getLanguage(context, 'sickBalance'),
                    style: AppTextStyles.textSize16(),
                  ),
                  Spacer(),
                  Text(
                    "37.0 h",
                    style:
                        AppTextStyles.textSize25(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
