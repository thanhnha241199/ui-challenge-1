import 'dart:ui';

import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/models/leave/leave.dart';
import 'package:bookkeepa/screens/leave/edit_leave_request.dart';
import 'package:bookkeepa/screens/leave/new_leave_request.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
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
  List<LeaveModel> items = [
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Doctor's Appointment",
        label1: AppImage.pending,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Trip to Sydney",
        label1: AppImage.approved,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Doctor's Appointment",
        label1: AppImage.pending,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Doctor's Appointment",
        label1: AppImage.approved,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Trip to Sydney",
        label1: AppImage.approved,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Doctor's Appointment",
        label1: AppImage.pending,
        label2: AppImage.sick_leave),
    LeaveModel(
        name: "Jackson Garrison",
        start: "8 Feb",
        end: "12 Feb 2021",
        hours: "36.5hrs",
        description: "Doctor's Appointment",
        label1: AppImage.approved,
        label2: AppImage.sick_leave)
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
      body: Column(
        children: [
          leaveBalance(),
          Expanded(
            child: CustomContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              edgeInsets:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              padding:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
              colorBorder: AppColors.grey.withOpacity(0.2),
              child: AppListView(
                data: items,
                renderItem: (item) {
                  return renderItem(context, item);
                },
                onLoadMore: () {
                  print('loadmore');
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(
            ontap: () {
              NavigationService.instance.navigateTo(NewLeaveRequest());
            },
            borderColor: AppColors.greenAccent,
            color: AppColors.greenAccent,
            text: AppTranslations().getLanguage(context, 'requestLeave'),
            height: 55.0,
            width: MediaQuery.of(context).size.width * 0.4,
            style: AppTextStyles.textSize14(),
          ),
          SizedBox(
            width: 20.0,
          ),
          FancyFab()
        ],
      ),
    );
  }

  Widget renderItem(BuildContext context, LeaveModel item) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            NavigationService.instance.navigateTo(EditLeave());
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: AppTextStyles.textSize16(),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "${item.start} - ${item.end}(${item.hours})",
                          style: AppTextStyles.textSize12(),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          item.description,
                          style: AppTextStyles.textSize12(),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          item.label1,
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SvgPicture.asset(
                          item.label2,
                          alignment: Alignment.center,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        items.indexOf(item) == items.length - 1 ? Container() : Divider()
      ],
    );
  }

  Widget leaveBalance() {
    return CustomContainer(
        edgeInsets: EdgeInsets.symmetric(
            horizontal: AppMetrics.paddingHorizotal,
            vertical: AppMetrics.paddingVertical),
        padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingContainer),
        colorBorder: AppColors.grey.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContent),
              child: Text(
                AppTranslations().getLanguage(context, 'leaveBalance'),
                style: AppTextStyles.textSize14(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContent),
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
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContent),
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
