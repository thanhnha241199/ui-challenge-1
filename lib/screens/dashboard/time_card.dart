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

class TimeCard extends StatefulWidget {
  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
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
            title: "My Time Card",
            style: AppTextStyles.textSize16(),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            formTimeCard(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingVertical),
              child: Column(
                children: [
                  CustomButton(
                    ontap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppMetrics.paddingHorizotal),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: Text("")),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Time Card Added",
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppMetrics.paddingContent,
                                      horizontal: AppMetrics.paddingHorizotal),
                                  child: Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text:
                                                    "This time card has been added to this week's timesheet. You can edit time card yor Timesheets as long as it is in ",
                                                style:
                                                    AppTextStyles.textSize16(),
                                              ),
                                              WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: SvgPicture.asset(
                                                      AppImage.draft)),
                                              TextSpan(
                                                text: " or ",
                                                style:
                                                    AppTextStyles.textSize16(),
                                              ),
                                              WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: SvgPicture.asset(
                                                      AppImage.pending)),
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppMetrics.paddingHorizotal,
                                        vertical: AppMetrics.paddingVertical),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppMetrics.paddingContent,
                                        vertical: AppMetrics.paddingContent),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.grey
                                                .withOpacity(0.2)),
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(
                                            AppMetrics.borderContainer)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Day Total",
                                              style: AppTextStyles.textSize12(),
                                            ),
                                            Text(
                                              "1h12m",
                                              style: AppTextStyles.textSize18(
                                                  color: AppColors.green),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Start",
                                              style: AppTextStyles.textSize12(),
                                            ),
                                            Text(
                                              "3:00pm",
                                              style: AppTextStyles.textSize18(),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "End",
                                              style: AppTextStyles.textSize12(),
                                            ),
                                            Text(
                                              "4:12pm",
                                              style: AppTextStyles.textSize18(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  ontap: () {},
                                  borderColor: AppColors.greenAccent,
                                  color: AppColors.greenAccent,
                                  text: "View My Timesheet",
                                  style: AppTextStyles.textSize14(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    color: AppColors.greenAccent,
                    borderColor: AppColors.greenAccent,
                    text: 'Clock Out',
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
                    color: AppColors.whiteColor,
                    borderColor: AppColors.greenAccent,
                    text: 'Cancel',
                    height: MediaQuery.of(context).size.height * 0.08,
                    style: AppTextStyles.textSize18(),
                  ),
                ],
              ),
            )
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
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '00',
                            style: AppTextStyles.textSize31(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'h',
                            style: AppTextStyles.textSize14(
                                color: AppColors.whiteColor)),
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '12',
                            style: AppTextStyles.textSize31(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'M',
                            style: AppTextStyles.textSize14(
                                color: AppColors.whiteColor)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                                      : DateFormat('dd/MM/yyyy').format(_date),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.textSize18(
                                      color: AppColors.blueLight),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: _selectDate,
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
                Expanded(
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
                                onTap: _selectTime,
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
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
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
              )),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.floatbtn,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Add Attachments",
                    style: AppTextStyles.textSize18(),
                  ),
                ],
              )),
          SizedBox(
            height: AppMetrics.paddingContainer,
          )
        ],
      ),
    );
  }

  void _selectDate() async {
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

  void _selectTime() async {
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
