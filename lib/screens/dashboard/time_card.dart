import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimeCard extends StatefulWidget {
  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 78.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('')),
                Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Time Card",
                          style: AppTextStyles.textSize16(),
                        )
                      ],
                    )),
                Expanded(flex: 1, child: Text(''))
              ],
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          formTimeCard(),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: AppMetrics.paddingVertical,
                horizontal: AppMetrics.paddingHorizotal),
            child: CustomButton(
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
                                      "Time Card Added",
                                      style: AppTextStyles.textSize18(
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        onTap: () {
                                          NavigationService.instance.goback();
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
                                    horizontal: AppMetrics.paddingHorizotal),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "This time card has been added to this week's timesheet. You can edit time card yor Timesheets as long as it is in ",
                                        maxLines: 10,
                                        style: AppTextStyles.textSize16(),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppImage.draft,
                                      alignment: Alignment.center,
                                    ),
                                    Text(
                                      "or",
                                      style: AppTextStyles.textSize16(),
                                      textAlign: TextAlign.start,
                                    ),
                                    SvgPicture.asset(
                                      AppImage.pending,
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                            flex: 5,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.14,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppMetrics.paddingHorizotal,
                                  vertical: AppMetrics.paddingVertical),
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppMetrics.paddingContent,
                                  vertical: AppMetrics.paddingContent),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey.withOpacity(0.2)),
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
                                  Divider(),
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
                                  Divider(),
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
                          Expanded(
                            flex: 3,
                            child: CustomButton(
                              ontap: () {},
                              color: AppColors.greenAccent,
                              text: "View My Timesheet",
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
              text: 'Clock Out',
              height: MediaQuery.of(context).size.height * 0.09,
              style: AppTextStyles.textSize18(),
            ),
          ),
        ],
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
            padding:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal,
                        vertical: AppMetrics.paddingContent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Time",
                          style: AppTextStyles.textSize12(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Today",
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal,
                        vertical: AppMetrics.paddingContent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "",
                          style: AppTextStyles.textSize12(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.clock,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "4:33pm",
                              style: AppTextStyles.textSize18(),
                            ),
                          ],
                        ),
                        Divider()
                      ],
                    )),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
              margin:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: AppTextStyles.textSize12(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Add location",
                        style: AppTextStyles.textSize18(),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppImage.search,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  Divider()
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
              margin:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Commnets",
                    style: AppTextStyles.textSize12(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Enter Note",
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
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent),
              margin:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
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
        ],
      ),
    );
  }
}
