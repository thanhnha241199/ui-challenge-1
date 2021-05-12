import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NewTimeCard extends StatefulWidget {
  @override
  _NewTimeCardState createState() => _NewTimeCardState();
}

class _NewTimeCardState extends State<NewTimeCard> {
  TextEditingController comments, location;
  TimeOfDay _time = TimeOfDay(hour: 4, minute: 33);
  DateTime _date;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    comments?.dispose();
    location?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
            title: "New Time Card",
            style: AppTextStyles.textSize16(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.whiteColor
                    : AppColors.black),
          )),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  formTimeCard(),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  CustomContainer(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingContainer,
                          vertical: AppMetrics.paddingVertical),
                      edgeInsets: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal),
                      colorBorder: AppColors.border,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImage.warningcircle,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You are next scheduled to clock in",
                                style: AppTextStyles.textSize14(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                              ),
                              Text(
                                "Tomorrow at 06:00pm",
                                style: AppTextStyles.textSize14(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.black),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: AppMetrics.paddingVertical,
                    horizontal: AppMetrics.paddingHorizotal),
                child: Column(
                  children: [
                    CustomButton(
                      ontap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0,
                                  horizontal: AppMetrics.paddingHorizotal),
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: AppMetrics.paddingVertical),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 1, child: Text("")),
                                        Expanded(
                                            flex: 4,
                                            child: Text(
                                              "Your Are About To Clock In",
                                              style: AppTextStyles.textSize20(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.black),
                                              textAlign: TextAlign.center,
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                                onTap: () {
                                                  NavigationService.instance
                                                      .goback();
                                                },
                                                child: SvgPicture.asset(
                                                  AppImage.close,
                                                  alignment: Alignment.center,
                                                )))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppMetrics.paddingHorizotal),
                                    child: Text(
                                      "Just to confirm: you are not scheduled to work today. Please confirm you would like to clock in a time",
                                      maxLines: 5,
                                      style: AppTextStyles.textSize16(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? AppColors.whiteColor
                                              : AppColors.black),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CustomButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        ontap: () {},
                                        borderColor: AppColors.greenAccent,
                                        color: AppColors.greenAccent,
                                        text: "Confirm Clock In",
                                        style: AppTextStyles.textSize14(),
                                      ),
                                      SizedBox(
                                        height: AppMetrics.paddingContainer,
                                      ),
                                      CustomButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        ontap: () {
                                          NavigationService.instance.goback();
                                        },
                                        borderColor: AppColors.greenAccent,
                                        color: AppColors.whiteColor,
                                        text: "Cancel",
                                        style: AppTextStyles.textSize14(
                                            color: AppColors.greyColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      color: AppColors.greenAccent,
                      borderColor: AppColors.greenAccent,
                      text: 'Clock In',
                      height: MediaQuery.of(context).size.height * 0.08,
                      style: AppTextStyles.textSize18(),
                    ),
                    SizedBox(
                      height: AppMetrics.paddingContainer,
                    ),
                    CustomButton(
                      ontap: () {
                        NavigationService.instance.goback();
                      },
                      borderColor: AppColors.greenAccent,
                      color: AppColors.whiteColor,
                      text: 'Cancel',
                      height: MediaQuery.of(context).size.height * 0.08,
                      style:
                          AppTextStyles.textSize18(color: AppColors.greyColor),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget formTimeCard() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
      colorBorder: AppColors.border,
      child: Column(
        children: [
          SizedBox(
            height: AppMetrics.paddingHorizotal,
          ),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
            colorBorder: AppColors.green,
            color: AppColors.green,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Day Total",
                        style: AppTextStyles.textSize12(
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        "0h00m",
                        style: AppTextStyles.textSize18(
                            color: AppColors.whiteColor),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Status",
                        style: AppTextStyles.textSize12(
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        "Off the clock",
                        style: AppTextStyles.textSize18(
                            color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppMetrics.paddingVertical,
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Time",
                              style: AppTextStyles.textSize12(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.colorText
                                      : AppColors.blueLight),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    _date == null
                                        ? "Today"
                                        : DateFormat('dd/MM/yyyy')
                                            .format(_date),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.textSize18(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.whiteColor
                                            : AppColors.blueLight),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: selectDate,
                                  child: SvgPicture.asset(
                                    AppImage.calendar,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.dividerDark
                                  : AppColors.divider,
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: AppMetrics.paddingHorizotal,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: AppTextStyles.textSize12(
                                  color: AppColors.blueLight),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: selectTime,
                                  child: SvgPicture.asset(
                                    AppImage.clock,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  _time.format(context),
                                  style: AppTextStyles.textSize18(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.whiteColor
                                          : AppColors.blueLight),
                                ),
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.dividerDark
                                  : AppColors.divider,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          InputField(
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
            onEditingComplete: () {},
            title: 'Location',
            hinttitle: 'Add Location',
            style: AppTextStyles.textSize18(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.whiteColor
                    : AppColors.black),
            textStyleHint: AppTextStyles.textSize18(color: AppColors.blueLight),
            textStyle: AppTextStyles.textSize18(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.colorText
                    : AppColors.blueLight),
            textInputAction: TextInputAction.done,
            controller: location,
          ),
          SizedBox(
            height: AppMetrics.paddingContent,
          ),
          InputField(
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
            onEditingComplete: () {},
            title: 'Comments',
            hinttitle: 'Enter Note',
            style: AppTextStyles.textSize18(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.whiteColor
                    : AppColors.black),
            textStyleHint: AppTextStyles.textSize18(color: AppColors.blueLight),
            textStyle: AppTextStyles.textSize18(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.colorText
                    : AppColors.blueLight),
            textInputAction: TextInputAction.done,
            controller: location,
          ),
          SizedBox(
            height: AppMetrics.paddingHorizotal,
          ),
        ],
      ),
    );
  }

  void selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.greenAccent,
              onPrimary: Colors.white,
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
        _date = newDate;
      });
    }
  }

  void selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }
}
