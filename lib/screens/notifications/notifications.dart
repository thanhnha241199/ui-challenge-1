import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<Notifications> {
  List<NotificationModel> items = [
    NotificationModel(
        title: "Jack Hihnson requested leave", read: true, time: "1m ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: true,
        time: "20m ago"),
    NotificationModel(
        title: "1 document needs to be signed", read: true, time: "1h ago"),
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
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              NavigationService.instance.goback();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24.0, top: 40.0),
              child: SvgPicture.asset(
                AppImage.xcircle,
                height: 50.0,
                width: 50.0,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Expanded(
            child: CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingContainer),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                colorBorder: AppColors.border,
                color: AppColors.whiteColor,
                child: AppListView(
                  data: items,
                  renderItem: (item) {
                    return renderItem(context, item);
                  },
                  onLoadMore: () {
                    print('loadmore');
                  },
                )),
          )
        ],
      ),
    );
  }

  renderItem(BuildContext context, NotificationModel item) {
    return items.indexOf(item) == 0
        ? Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:
                    item.read == true ? AppColors.green20 : Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppMetrics.borderContainer),
                    topRight: Radius.circular(AppMetrics.borderContainer))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingContent,
                      horizontal: AppMetrics.paddingContent),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: AppTextStyles.textSize16(),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            item.time,
                            style: AppTextStyles.textSize16(
                                color: AppColors.greyColor),
                          ),
                        ),
                      ]),
                ),
                items.indexOf(item) == items.length - 1
                    ? Container()
                    : Divider(
                        height: 1,
                        color: AppColors.border,
                      )
              ],
            ))
        : items.indexOf(item) == items.length - 1
            ? Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: item.read == true
                              ? AppColors.green20
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(AppMetrics.borderContainer),
                              bottomRight:
                                  Radius.circular(AppMetrics.borderContainer))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppMetrics.paddingContent,
                                horizontal: AppMetrics.paddingContent),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item.title,
                                      style: AppTextStyles.textSize16(),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      item.time,
                                      style: AppTextStyles.textSize16(
                                          color: AppColors.greyColor),
                                    ),
                                  ),
                                ]),
                          ),
                          items.indexOf(item) == items.length - 1
                              ? Container()
                              : Divider(
                                  height: 1,
                                  color: AppColors.divider,
                                )
                        ],
                      )),
                ],
              )
            : Column(
                children: [
                  Container(
                      color: item.read == true
                          ? AppColors.green20
                          : Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppMetrics.paddingContent,
                                horizontal: AppMetrics.paddingContent),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item.title,
                                      style: AppTextStyles.textSize16(),
                                      maxLines: 10,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      item.time,
                                      style: AppTextStyles.textSize16(
                                          color: AppColors.greyColor),
                                    ),
                                  ),
                                ]),
                          ),
                          items.indexOf(item) == items.length - 1
                              ? Container()
                              : Divider(
                                  height: 1,
                                  color: AppColors.divider,
                                )
                        ],
                      )),
                ],
              );
  }
}
