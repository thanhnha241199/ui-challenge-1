import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';

class Timesheets extends StatefulWidget {
  @override
  _TimesheetsState createState() => _TimesheetsState();
}

class _TimesheetsState extends State<Timesheets> {
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
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImage.arrowcircleleft,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "April 2021",
                  style: AppTextStyles.textSize16(),
                ),
                SizedBox(
                  width: 70,
                ),
                SvgPicture.asset(
                  AppImage.arrowcircleright,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apr 12 - Apr 28 2021",
                              style: AppTextStyles.textSize16(
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              AppImage.draft,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "40",
                                  style: AppTextStyles.textSize16(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Actual",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "35.0",
                                  style: AppTextStyles.textSize16(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.green),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                Divider(),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apr 12 - Apr 28 2021",
                              style: AppTextStyles.textSize16(
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Schedule",
                                        style: AppTextStyles.textSize12()),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "40",
                                      style: AppTextStyles.textSize16(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Actual",
                                      style: AppTextStyles.textSize12(),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "35.0",
                                      style: AppTextStyles.textSize16(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.green),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppImage.approved,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.paperclip,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("1")
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                Divider(),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apr 12 - Apr 28 2021",
                              style: AppTextStyles.textSize16(
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Schedule",
                                        style: AppTextStyles.textSize12()),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "40",
                                      style: AppTextStyles.textSize16(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Actual",
                                      style: AppTextStyles.textSize12(),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "35.0",
                                      style: AppTextStyles.textSize16(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.green),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppImage.pending,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.paperclip,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("3")
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                Divider(),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apr 12 - Apr 28 2021",
                              style: AppTextStyles.textSize16(
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              AppImage.draft,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "40",
                                  style: AppTextStyles.textSize16(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Actual",
                                  style: AppTextStyles.textSize12(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "35.0",
                                  style: AppTextStyles.textSize16(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.green),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }
}
