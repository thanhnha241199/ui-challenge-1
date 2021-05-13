import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class NotificationPreference extends StatefulWidget {
  bool switchButton;
  bool switchNews;
  NotificationPreference({this.switchButton, this.switchNews});
  @override
  _NotificationPreferenceState createState() => _NotificationPreferenceState();
}

class _NotificationPreferenceState extends State<NotificationPreference> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      height: MediaQuery.of(context).size.height * 0.3,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(child: Text("")),
                Expanded(
                    flex: 5,
                    child: Text(
                      "Notification Preferences",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textSize20(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.black),
                    )),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          NavigationService.instance.goback();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.0),
                          child: SvgPicture.asset(
                            AppImage.close,
                            alignment: Alignment.center,
                          ),
                        )))
              ],
            ),
            SizedBox(
              height: AppMetrics.paddingHorizotal,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Generic Notifications",
                        style: AppTextStyles.textSize16(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                      ),
                      Spacer(),
                      widget.switchButton
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.switchButton = !widget.switchButton;
                                });
                              },
                              child: SvgPicture.asset(
                                AppImage.switch_on,
                                width: 51.0,
                                height: 31.0,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.switchButton = !widget.switchButton;
                                });
                              },
                              child: SvgPicture.asset(
                                AppImage.switch_off,
                                width: 51.0,
                                height: 31.0,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bookkeepa News & Promotions",
                        style: AppTextStyles.textSize16(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                      ),
                      Spacer(),
                      widget.switchNews
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.switchNews = !widget.switchNews;
                                });
                              },
                              child: SvgPicture.asset(
                                AppImage.switch_on,
                                width: 51.0,
                                height: 31.0,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.switchNews = !widget.switchNews;
                                });
                              },
                              child: SvgPicture.asset(
                                AppImage.switch_off,
                                width: 51.0,
                                height: 31.0,
                              ),
                            ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
