import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../config/app_metrics.dart';
import '../../widgets/header_view.dart';

class EditLeave extends StatefulWidget {
  @override
  _EditLeaveState createState() => _EditLeaveState();
}

class _EditLeaveState extends State<EditLeave> {
  bool checkallday = false;
  TextEditingController description;
  DateTime _dateStart = DateTime(2021, 03, 11);
  DateTime _dateFrom = DateTime(2021, 03, 11);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    description?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'editLeave'),
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: CustomContainer(
                  colorBorder: AppColors.border,
                  edgeInsets:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        child: DropdownButtonFormField<String>(
                          items: [
                            "Sick Leave",
                            'Sick Leave 2',
                            'Sick Leave 3',
                            'Sick Leave 4',
                            'Sick Leave 5'
                          ]
                              .map((label) => DropdownMenuItem(
                                    child: Text(label.toString()),
                                    value: label,
                                  ))
                              .toList(),
                          value: "Sick Leave",
                          style: AppTextStyles.textSize18(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.blueLight),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey10),
                              ),
                              labelText: 'Leave Type',
                              hintText: 'Sick Leave',
                              hintStyle: AppTextStyles.textSize18(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.blueLight),
                              labelStyle: AppTextStyles.textSize12(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.colorText
                                      : AppColors.blueLight)),
                          icon: SvgPicture.asset(
                            AppImage.caretdown,
                            alignment: Alignment.center,
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      InputField(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        onEditingComplete: () {},
                        title: 'Leave Description',
                        hinttitle: 'Add Description',
                        style: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.black),
                        textStyleHint: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        textStyle: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.colorText
                                    : AppColors.blueLight),
                        textInputAction: TextInputAction.done,
                        controller: description,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMetrics.paddingHorizotal,
                              vertical: AppMetrics.paddingContent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Date",
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
                                children: [
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(_dateStart),
                                    style: AppTextStyles.textSize18(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.whiteColor
                                            : AppColors.blueLight),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: _selectDateStart,
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
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMetrics.paddingHorizotal,
                              vertical: AppMetrics.paddingContent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Date",
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
                                children: [
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(_dateFrom),
                                    style: AppTextStyles.textSize18(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.whiteColor
                                            : AppColors.blueLight),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: _selectDateEnd,
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
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMetrics.paddingHorizotal,
                              vertical: AppMetrics.paddingContent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkallday
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                checkallday = !checkallday;
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              AppImage.radio_checked,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            "All-day",
                                            style: AppTextStyles.textSize14(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? AppColors.whiteColor
                                                    : AppColors.black),
                                          )
                                        ])
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                checkallday = !checkallday;
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              AppImage.radio_unchecked,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            "All-day",
                                            style: AppTextStyles.textSize14(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? AppColors.whiteColor
                                                    : AppColors.black),
                                          )
                                        ]),
                              SizedBox(
                                height: 20.0,
                              ),
                              checkallday
                                  ? Container()
                                  : CustomContainer(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppMetrics
                                              .paddingHorizontalContainer,
                                          vertical: AppMetrics
                                                  .paddingHorizontalContainer -
                                              2),
                                      colorBorder: AppColors.border,
                                      child: Row(children: [
                                        Flexible(
                                            flex: 3,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.clock,
                                                  alignment: Alignment.center,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  "09:00am",
                                                  style: AppTextStyles.textSize16(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? AppColors.whiteColor
                                                          : AppColors.black),
                                                )
                                              ],
                                            )),
                                        Flexible(
                                            flex: 3,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.clock,
                                                  alignment: Alignment.center,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  "12:00am",
                                                  style: AppTextStyles.textSize16(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? AppColors.whiteColor
                                                          : AppColors.black),
                                                )
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              checkallday = true;
                                            },
                                            child: SvgPicture.asset(
                                              AppImage.close,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ]))
                            ],
                          )),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                            padding: EdgeInsets.symmetric(vertical: 30.0),
                            height: MediaQuery.of(context).size.height * 0.55,
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
                                          "Leave Requested",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.textSize18(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? AppColors.whiteColor
                                                  : AppColors.black),
                                        )),
                                    Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              NavigationService.instance
                                                  .goback();
                                            },
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 24.0),
                                              child: SvgPicture.asset(
                                                AppImage.close,
                                                alignment: Alignment.center,
                                              ),
                                            )))
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 38.0,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppMetrics.paddingHorizotal),
                                          child: Text(
                                            "Your leave request has been submitted. You will be notified once your employer Approves or rejects it.",
                                            style: AppTextStyles.textSize16(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? AppColors.whiteColor
                                                    : AppColors.black),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24.0,
                                        ),
                                        SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: AppMetrics
                                                        .paddingHorizotal),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Jackson Garrison",
                                                          style: AppTextStyles.textSize16(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : AppColors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "8 Feb - 12 2021 (36.5hrs)",
                                                          style: AppTextStyles.textSize12(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : AppColors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Doctor's Appointment",
                                                          style: AppTextStyles.textSize12(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : AppColors
                                                                      .black),
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImage.pending,
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        SvgPicture.asset(
                                                          AppImage.sick_leave,
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppMetrics.paddingHorizotal),
                                  child: CustomButton(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    ontap: () {
                                      NavigationService.instance.goback();
                                    },
                                    borderColor: AppColors.greenAccent,
                                    color: AppColors.greenAccent,
                                    text: "Close",
                                    style: AppTextStyles.textSize14(),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    borderColor: AppColors.greenAccent,
                    color: AppColors.greenAccent,
                    text: "Request Leave",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
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
                    text: "Cancel",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(color: AppColors.greyColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _selectDateStart() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _dateStart,
      firstDate: DateTime(2021, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date start',
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
        _dateStart = newDate;
      });
    }
  }

  void _selectDateEnd() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _dateFrom,
      firstDate: DateTime(2021, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date end',
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
        _dateFrom = newDate;
      });
    }
  }
}
