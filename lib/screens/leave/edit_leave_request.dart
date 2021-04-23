import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/header_view.dart';

class EditLeave extends StatefulWidget {
  @override
  _EditLeaveState createState() => _EditLeaveState();
}

class _EditLeaveState extends State<EditLeave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
        height: 90.0,
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
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Text(
                  "Edit Leave Request",
                  style: AppTextStyles.textSize16(),
                  textAlign: TextAlign.center,
                )),
            Expanded(flex: 1, child: Text(''))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                padding: EdgeInsets.symmetric(vertical: 10.0),
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
                              "Leave Tyoe",
                              style: AppTextStyles.textSize12(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Sick Leave",
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
                                  hintText: 'Doctor\'s Appointment',
                                  labelText: 'Leave Description'),
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
                                  "11/03/2021",
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
                                  "11/03/2021",
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppImage.radio,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "All-day",
                                    style: AppTextStyles.textSize14(),
                                  )
                                ]),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
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
                                                style:
                                                    AppTextStyles.textSize16(),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
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
                                                style:
                                                    AppTextStyles.textSize16(),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: SvgPicture.asset(
                                          AppImage.close,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ]))
                          ],
                        )),
                  ],
                )),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 20.0),
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
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
                                              child: Icon(Icons
                                                  .delete_forever_rounded)))
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Your leave request has been submitted. \nYou will be notified once your employer\nApproves or rejects it.",
                                      style: AppTextStyles.textSize16(),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
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
                                  flex: 2,
                                  child: CustomButton(
                                    ontap: () {
                                      NavigationService.instance.goback();
                                    },
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
                    text: "Request Leave",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance.goback();
                    },
                    color: AppColors.whiteColor,
                    text: "Cancel",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
