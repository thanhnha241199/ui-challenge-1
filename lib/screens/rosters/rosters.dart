import 'dart:ui';

import 'package:bookkeepa/screens/dashboard/time_card.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';

class Rosters extends StatefulWidget {
  @override
  _RostersState createState() => _RostersState();
}

class _RostersState extends State<Rosters> {
  int index;
  String _range =
      '${DateFormat('MMM d').format(DateTime.now())} - ${DateFormat('MMM d yyyy').format(DateTime.now().add(Duration(days: 3)))}';
  DateTimeRange time;

  void _selectDate() async {
    final DateTimeRange newDate = await showDateRangePicker(
      context: context,
      initialDateRange: time,
      firstDate: DateTime(2021, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date range',
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.greenAccent,
              surface: AppColors.greenAccent,
              onSurface: Colors.black,
            ),
          ),
          child: child,
        );
      },
    );
    if (newDate != null) {
      setState(() {
        time = newDate;
        _range =
            '${DateFormat('MMM d').format(newDate.start)} - ${DateFormat('MMM d yyyy').format(newDate.end)}';
      });
    }
  }

  @override
  void initState() {
    time = DateTimeRange(
        start: DateTime.now(), end: DateTime.now().add(Duration(days: 3)));
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        margin: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wesnesday, 4th April 2021",
              style: AppTextStyles.textSize14(),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingVertical),
              width: MediaQuery.of(context).size.width * 0.6,
              colorBorder: AppColors.border,
              child: Text(
                "09:00ap to 12:00pm",
                style: AppTextStyles.textSize16(),
              ),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer,
            ),
            Text(
              "Thursday, 5th April 2021",
              style: AppTextStyles.textSize14(),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingVertical),
              colorBorder: AppColors.border,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImage.calendar,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: AppMetrics.paddingContainer / 2,
                  ),
                  Text(
                    "This is today",
                    style: AppTextStyles.textSize14(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContainer),
              width: MediaQuery.of(context).size.width,
              colorBorder: AppColors.border,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "09:00am to 12:00pm",
                    style: AppTextStyles.textSize16(),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance
                          .pushPage(context, false, TimeCard());
                    },
                    borderColor: AppColors.greenAccent,
                    color: AppColors.greenAccent,
                    text: AppTranslations().getLanguage(context, 'clockin'),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    style: AppTextStyles.textSize16(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer,
                    vertical: AppMetrics.paddingVertical),
                width: MediaQuery.of(context).size.width,
                colorBorder: AppColors.border,
                child: Text(
                  "01:00pm to 05:00pm",
                  style: AppTextStyles.textSize16(),
                )),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wesnesday, 4th April 2021",
              style: AppTextStyles.textSize14(),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingVertical),
              width: MediaQuery.of(context).size.width * 0.6,
              colorBorder: AppColors.border,
              child: Text(
                "09:00ap to 12:00pm",
                style: AppTextStyles.textSize16(),
              ),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer,
            ),
            Text(
              "Thursday, 5th April 2021",
              style: AppTextStyles.textSize14(),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingContainer,
                  vertical: AppMetrics.paddingContainer),
              width: MediaQuery.of(context).size.width,
              colorBorder: AppColors.border,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "09:00am to 12:00pm",
                    style: AppTextStyles.textSize16(),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance
                          .pushPage(context, false, TimeCard());
                    },
                    borderColor: AppColors.greenAccent,
                    color: AppColors.greenAccent,
                    text: AppTranslations().getLanguage(context, 'clockin'),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    style: AppTextStyles.textSize16(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppMetrics.paddingContainer / 2,
            ),
            CustomContainer(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer,
                    vertical: AppMetrics.paddingVertical),
                width: MediaQuery.of(context).size.width,
                colorBorder: AppColors.border,
                child: Text(
                  "01:00pm to 05:00pm",
                  style: AppTextStyles.textSize16(),
                )),
          ],
        ),
      ),
    ];
    return Scaffold(
        appBar: HeaderView(
            color: Colors.transparent,
            child: HeaderChild(
                title: AppTranslations().getLanguage(context, 'myRoster'),
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
                              sigmaX: 30 * anim1.value,
                              sigmaY: 30 * anim1.value),
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
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingVertical),
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index > 0) {
                          index--;
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      AppImage.arrowcircleleft,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.0,
                  ),
                  GestureDetector(
                    onTap: _selectDate,
                    child: Text(
                      _range,
                      style: AppTextStyles.textSize16(),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index < widgets.length - 1) {
                          index++;
                        }
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
            widgets[index]
          ],
        ),
        floatingActionButton: FancyFab());
  }
}
