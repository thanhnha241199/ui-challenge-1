import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';
import '../../util/navigator_serivce.dart';
import '../../widgets/header_view.dart';

class NewLeaveRequest extends StatefulWidget {
  @override
  _NewLeaveRequestState createState() => _NewLeaveRequestState();
}

class _NewLeaveRequestState extends State<NewLeaveRequest> {
  TextEditingController description;
  DateTime dateFrom, dateTo;
  @override
  void initState() {
    description = TextEditingController(text: 'Add Description');
    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: HeaderView(
            color: Colors.transparent,
            child: HeaderChild(
                title: "New Leave Request",
                style: AppTextStyles.textSize16(),
                leftIcon: SvgPicture.asset(AppImage.arrow_back))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: DropdownButtonFormField<String>(
                        items: [
                          "Select Leave type 1",
                          'Select Leave type 2',
                          'Select Leave type 3',
                          'Select Leave type 4',
                          'Select Leave type 5'
                        ]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString()),
                                  value: label,
                                ))
                            .toList(),
                        value: "Select Leave type 1",
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            labelText: 'Leave Type',
                            hintText: 'Select Leave Type',
                            hintStyle:
                                AppTextStyles.textSize18(color: AppColors.grey),
                            labelStyle: AppTextStyles.textSize12(
                                color: AppColors.grey)),
                        icon: SvgPicture.asset(
                          AppImage.caretdown,
                          alignment: Alignment.center,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: description,
                              decoration: InputDecoration(
                                  hintText: 'Add Description',
                                  labelText: 'Leave Description',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.grey10),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.grey10),
                                  ),
                                  hintStyle: AppTextStyles.textSize18(
                                      color: AppColors.grey),
                                  labelStyle: AppTextStyles.textSize12(
                                      color: AppColors.grey)),
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: GestureDetector(
                          onTap: _selectDateFrom,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Date",
                                style: AppTextStyles.textSize12(
                                    color: AppColors.grey),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    dateFrom.toString() == null
                                        ? "From"
                                        : dateFrom.toString(),
                                    style: AppTextStyles.textSize20(
                                        color: AppColors.grey),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    AppImage.calendar,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: GestureDetector(
                          onTap: _selectDateTo,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Date",
                                style: AppTextStyles.textSize12(
                                    color: AppColors.grey),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    dateTo.toString() == null
                                        ? "To"
                                        : dateTo.toString(),
                                    style: AppTextStyles.textSize20(
                                        color: AppColors.grey),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    AppImage.calendar,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        )),
                  ],
                )),
            Container(
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
                            padding: EdgeInsets.symmetric(
                                vertical: 30.0,
                                horizontal: AppMetrics.paddingHorizotal),
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 2, child: Text("")),
                                      Expanded(
                                          flex: 5,
                                          child: Text(
                                            "Leave Requested",
                                            style: AppTextStyles.textSize18(
                                                fontWeight: FontWeight.bold),
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
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppMetrics.paddingHorizotal),
                                      child: Text(
                                        "Your leave request has been submitted. \nYou will be notified once your employer\nApproves or rejects it.",
                                        style: AppTextStyles.textSize16(),
                                        textAlign: TextAlign.start,
                                      ),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppMetrics.paddingHorizotal),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jackson Garrison",
                                                  style: AppTextStyles
                                                      .textSize16(),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "8 Feb - 12 2021 (36.5hrs)",
                                                  style: AppTextStyles
                                                      .textSize12(),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Doctor's Appointment",
                                                  style: AppTextStyles
                                                      .textSize12(),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.pending,
                                                  alignment: Alignment.center,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                SvgPicture.asset(
                                                  AppImage.sick_leave,
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CustomButton(
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
                    color: AppColors.greenAccent,
                    borderColor: AppColors.greenAccent,
                    text: "Request Leave",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance.goback();
                    },
                    borderColor: AppColors.greenAccent,
                    color: AppColors.whiteColor,
                    text: "Cancel",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _selectDateFrom() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        dateFrom = newDate;
      });
    }
  }

  void _selectDateTo() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        dateTo = newDate;
      });
    }
  }
}
