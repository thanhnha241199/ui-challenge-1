import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatefulWidget {
  final List<NotificationModel> items;
  Notifications({this.items});
  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: () {
              NavigationService.instance.goback();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, right: 40.0),
              child: SvgPicture.asset(
                AppImage.xcircle,
                height: 50.0,
                width: 50.0,
              ),
            )),
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppMetrics.borderContainer))),
          child: SingleChildScrollView(
            child: CustomContainer(
              width: MediaQuery.of(context).size.width,
              colorBorder: AppColors.grey.withOpacity(0.2),
              child: Column(
                children: [
                  ..._getBody(widget.items),
                ],
              ),
            ),
          ),
          elevation: 2,
        )
      ],
    );
  }

  _getBody(List<NotificationModel> items) {
    return items.map((e) {
      return items.indexOf(e) == 0
          ? Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: e.read == true ? AppColors.green20 : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppMetrics.borderContainer),
                      topRight: Radius.circular(AppMetrics.borderContainer))),
              padding: EdgeInsets.symmetric(
                  vertical: AppMetrics.paddingVertical,
                  horizontal: AppMetrics.paddingHorizotal),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        e.title,
                        style: AppTextStyles.textSize16(),
                        maxLines: 10,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        e.time,
                        style: AppTextStyles.textSize16(),
                      ),
                    )
                  ]),
            )
          : items.indexOf(e) == items.length - 1
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: e.read == true ? AppColors.green20 : Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(AppMetrics.borderContainer),
                          bottomRight:
                              Radius.circular(AppMetrics.borderContainer))),
                  padding: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingVertical,
                      horizontal: AppMetrics.paddingHorizotal),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            e.title,
                            style: AppTextStyles.textSize16(),
                            maxLines: 10,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            e.time,
                            style: AppTextStyles.textSize16(),
                          ),
                        )
                      ]),
                )
              : Container(
                  color: e.read == true ? AppColors.green20 : Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingVertical,
                      horizontal: AppMetrics.paddingHorizotal),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            e.title,
                            style: AppTextStyles.textSize16(),
                            maxLines: 10,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            e.time,
                            style: AppTextStyles.textSize16(),
                          ),
                        )
                      ]),
                );
    });
  }
}
