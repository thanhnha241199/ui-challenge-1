import 'package:bookkeepa/widgets/custom_btn.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeaderView(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    NavigationService.instance.goback();
                  },
                  child: SvgPicture.asset(
                    AppImage.arrow_back,
                    alignment: Alignment.center,
                    height: 21.0,
                    width: 11.0,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppMetrics.paddingContainer),
                    child: Text(
                      "New Leave Request",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(flex: 1, child: Text(''))
            ],
          ),
        ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Leave Type",
                              style: AppTextStyles.textSize12(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Select Leave Type",
                                  style: AppTextStyles.textSize18(),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppImage.caretdown,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Add Description',
                                  labelText: 'Leave Description',
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
                              style: AppTextStyles.textSize12(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "From",
                                  style: AppTextStyles.textSize20(),
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
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Date",
                              style: AppTextStyles.textSize12(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "To",
                                  style: AppTextStyles.textSize20(),
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
}
