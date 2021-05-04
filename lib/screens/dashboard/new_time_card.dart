import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
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
    comments = TextEditingController(text: 'Enter Note');
    location = TextEditingController(text: 'Add location');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
            title: "New Time Card",
            style: AppTextStyles.textSize16(),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                formTimeCard(),
                CustomContainer(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingContainer,
                        vertical: AppMetrics.paddingVertical),
                    edgeInsets: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal),
                    colorBorder: AppColors.grey.withOpacity(0.2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.warningcircle,
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You are next scheduled to clock in",
                              style: AppTextStyles.textSize14(),
                            ),
                            Text(
                              "Tomorrow at 06:00pm",
                              style: AppTextStyles.textSize14(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
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
                                                  fontWeight: FontWeight.bold),
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
                                      style: AppTextStyles.textSize16(),
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
                                        style: AppTextStyles.textSize14(),
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
                      style: AppTextStyles.textSize18(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget formTimeCard() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingVertical),
      colorBorder: AppColors.grey.withOpacity(0.2),
      child: Column(
        children: [
          CustomContainer(
            edgeInsets: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            colorBorder: AppColors.green,
            color: AppColors.green,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Time",
                              style: AppTextStyles.textSize12(
                                  color: AppColors.blueLight),
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
                                        color: AppColors.blueLight),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: selectDate,
                                    child: SvgPicture.asset(
                                      AppImage.calendar,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
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
                                      color: AppColors.blueLight),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: TextField(
                style: AppTextStyles.textSize18(color: AppColors.blueLight),
                controller: location,
                decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      AppImage.search,
                      height: 18.0,
                      width: 18.0,
                    ),
                    hintText: 'Add Location',
                    labelStyle:
                        AppTextStyles.textSize12(color: AppColors.blueLight),
                    hintStyle:
                        AppTextStyles.textSize18(color: AppColors.blueLight),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey10),
                    ),
                    labelText: 'Location'),
              )),
          Container(
            padding: EdgeInsets.only(
                left: AppMetrics.paddingHorizotal,
                right: AppMetrics.paddingHorizotal,
                bottom: AppMetrics.paddingHorizotal),
            child: TextField(
              style: AppTextStyles.textSize18(color: AppColors.blueLight),
              controller: comments,
              decoration: InputDecoration(
                  hintText: 'Enter Note',
                  labelStyle:
                      AppTextStyles.textSize12(color: AppColors.blueLight),
                  hintStyle:
                      AppTextStyles.textSize18(color: AppColors.blueLight),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey10),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey10),
                  ),
                  labelText: 'Comments'),
            ),
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
