import 'package:bookkeepa/blocs/notification/notification_bloc.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<Notifications> {
  List<NotificationModel> items = [];
  @override
  void initState() {
    BlocProvider.of<NotificationBloc>(context).add(FetchNotification());
    super.initState();
  }

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
              padding: EdgeInsets.only(
                  right: AppMetrics.paddingHorizotal, top: 40.0),
              child: SvgPicture.asset(
                AppImage.xcircle,
                height: 50.0,
                width: 50.0,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          SizedBox(
            height: AppMetrics.paddingContainer,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: AppMetrics.paddingHorizotal,
                  right: AppMetrics.paddingHorizotal,
                  bottom: 40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.black300
                      : AppColors.whiteColor,
                  child: BlocBuilder<NotificationBloc, NotificationState>(
                    builder: (context, state) {
                      return AppListView(
                        data: state.notificationData ?? [],
                        renderItem: (item) {
                          return renderItem(context, item);
                        },
                        onLoadMore: () {
                          print('loadmore');
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderItem(BuildContext context, NotificationModel item) {
    return Column(
      children: [
        Container(
            color: item.isRead == true
                ? Theme.of(context).brightness == Brightness.dark
                    ? AppColors.backgroundNotification
                    : AppColors.green20
                : Theme.of(context).brightness == Brightness.dark
                    ? AppColors.black300
                    : Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingHorizotal,
                      horizontal: AppMetrics.paddingContainer),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            item.title,
                            style: AppTextStyles.textSize16(
                                color: item.isRead == true
                                    ? AppColors.black
                                    : Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                            maxLines: 3,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            item.createdAt,
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.dividerDark
                            : AppColors.divider,
                      ),
              ],
            )),
      ],
    );
  }
}
