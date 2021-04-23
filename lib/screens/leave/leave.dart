import 'package:bookkeepa/screens/leave/edit_leave_request.dart';
import 'package:bookkeepa/screens/leave/new_leave_request.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_text_styles.dart';
import '../../util/navigator_serivce.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
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
            Expanded(flex: 1, child: Text("")),
            Expanded(
                flex: 4,
                child: Text(
                  "My Timesheets",
                  style: AppTextStyles.textSize16(),
                  textAlign: TextAlign.center,
                )),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                AppImage.notification,
                alignment: Alignment.center,
                height: 20.0,
                width: 20.0,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Text(
                      "Leave Balance",
                      style:
                          AppTextStyles.textSize14(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Amnual Leave Balance",
                              style: AppTextStyles.textSize16(),
                            ),
                            Spacer(),
                            Text(
                              "23.5 h",
                              style: AppTextStyles.textSize25(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Sick Leave Balance",
                          style: AppTextStyles.textSize16(),
                        ),
                        Spacer(),
                        Text(
                          "37.0 h",
                          style: AppTextStyles.textSize25(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
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
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Trip to Sydney",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
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
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
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
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
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
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jackson Garrison",
                                  style: AppTextStyles.textSize16(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8 Feb - 12 2021 (36.5hrs)",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Doctor's Appointment",
                                  style: AppTextStyles.textSize12(),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  AppImage.approved,
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
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            ontap: () {
              NavigationService.instance.navigateTo(EditLeave());
            },
            color: AppColors.greenAccent,
            text: "Request Leave",
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.4,
            style: AppTextStyles.textSize14(),
          ),
          SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () {
              NavigationService.instance.navigateTo(NewLeaveRequest());
            },
            child: SvgPicture.asset(
              AppImage.floatbtn,
            ),
          ),
        ],
      ),
    );
  }
}
