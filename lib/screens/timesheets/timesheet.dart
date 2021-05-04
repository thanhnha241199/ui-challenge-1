import 'dart:ui';

import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/models/timesheet/timesheet.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/screens/timesheets/new_timesheet.dart';
import 'package:bookkeepa/screens/timesheets/timesheet_detail.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
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

class Timesheets extends StatefulWidget {
  @override
  _TimesheetsState createState() => _TimesheetsState();
}

class _TimesheetsState extends State<Timesheets> {
  int index;
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
  List<TimeSheetModel> items = [
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "40.0",
        actual: "35.0",
        file: 0),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "approved",
        scheduled: "40.0",
        actual: "35.0",
        file: 1),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "pending",
        scheduled: "40.0",
        actual: "35.0",
        file: 3),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "40.0",
        actual: "35.0",
        file: 0),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "40.0",
        actual: "35.0",
        file: 0),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "approved",
        scheduled: "40.0",
        actual: "35.0",
        file: 1),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "pending",
        scheduled: "40.0",
        actual: "35.0",
        file: 3),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "40.0",
        actual: "35.0",
        file: 0)
  ];
  List<TimeSheetModel> items2 = [
    TimeSheetModel(
        start: "Apr 22",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "55.0",
        actual: "35.0",
        file: 1),
    TimeSheetModel(
        start: "Apr 21",
        end: "Apr 28 2021",
        label: "approved",
        scheduled: "40.0",
        actual: "35.0",
        file: 1),
    TimeSheetModel(
        start: "Apr 11",
        end: "Apr 28 2021",
        label: "pending",
        scheduled: "40.0",
        actual: "12.0",
        file: 3),
    TimeSheetModel(
        start: "Apr 12",
        end: "Apr 28 2021",
        label: "draft",
        scheduled: "40.0",
        actual: "42.0",
        file: 0)
  ];
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title:
                  "My ${AppTranslations().getLanguage(context, 'timesheets')}",
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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: SvgPicture.asset(
                    AppImage.arrowcircleleft,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  index == 0 ? "April 2021" : "May 2021",
                  style: AppTextStyles.textSize16(),
                ),
                SizedBox(
                  width: 70,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: SvgPicture.asset(
                    AppImage.arrowcircleright,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          CustomContainer(
            edgeInsets: EdgeInsets.only(
                top: 70.0,
                left: AppMetrics.paddingHorizotal,
                right: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.only(top: AppMetrics.paddingContent),
            colorBorder: AppColors.grey.withOpacity(0.2),
            child: AppListView(
              data: index == 0 ? items : items2,
              renderItem: (item) {
                return renderItem(context, item);
              },
              onLoadMore: () {
                print('loadmore');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            NavigationService.instance
                .pushPage(context, false, NewTimeSheetDetail());
          },
          child: FancyFab()),
    );
  }

  Widget renderItem(BuildContext context, TimeSheetModel item) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            NavigationService.instance.pushPage(
                context, false, TimeSheetDetail(timeSheetModel: item));
          },
          child: Container(
              margin: EdgeInsets.only(
                  left: AppMetrics.paddingContainer,
                  right: AppMetrics.paddingContainer,
                  bottom: AppMetrics.paddingContainer,
                  top: AppMetrics.paddingVertical),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item.start} - ${item.end}",
                        style: AppTextStyles.textSize16(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Schedule",
                                  style: AppTextStyles.textSize12()),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "${item.scheduled}",
                                style: AppTextStyles.textSize16(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Actual",
                                style: AppTextStyles.textSize12(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "${item.actual}",
                                style: AppTextStyles.textSize16(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      item.label == 'draft'
                          ? SvgPicture.asset(
                              AppImage.draft,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            )
                          : item.label == 'approved'
                              ? SvgPicture.asset(
                                  AppImage.approved,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                )
                              : SvgPicture.asset(
                                  AppImage.pending,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                ),
                      SizedBox(
                        height: 30.0,
                      ),
                      item.file == 0
                          ? Text('')
                          : Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.paperclip,
                                  fit: BoxFit.scaleDown,
                                  width: 12.0,
                                  height: 14.0,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  item.file.toString(),
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            )
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  )
                ],
              )),
        ),
        items.indexOf(item) == items.length - 1 ? Container() : Divider()
      ],
    );
  }
}
