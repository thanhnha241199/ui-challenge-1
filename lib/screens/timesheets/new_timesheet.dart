import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/timesheet/detailtimesheet.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewTimeSheetDetail extends StatefulWidget {
  @override
  _NewTimeSheetDetailState createState() => _NewTimeSheetDetailState();
}

class _NewTimeSheetDetailState extends State<NewTimeSheetDetail> {
  TextEditingController comments;
  DetailTimeSheetModel items = DetailTimeSheetModel(
      infor: Infor(name: "Jackson Garrison", manager: "Manager"),
      detail: [
        Detail(
          day: "28/02",
          toalactual: "7.0",
          toalschedule: "8.0",
          elementdetail: [
            Elementdetail(
                description: "131 Collins St.",
                actual: "4.0",
                schedule: "4.0",
                time: "08:00am - 12:00pm"),
            Elementdetail(
                description: "131 Collins St.",
                actual: "0.0",
                schedule: "3.0",
                time: "08:00am - 12:00pm")
          ],
        ),
        Detail(
          day: "27/02",
          toalactual: "7.0",
          toalschedule: "8.0",
          elementdetail: [
            Elementdetail(
                description: "131 Collins St.",
                actual: "4.0",
                schedule: "4.0",
                time: "08:00am - 12:00pm"),
            Elementdetail(
                description: "131 Collins St.",
                actual: "0.0",
                schedule: "3.0",
                time: "08:00am - 12:00pm")
          ],
        ),
        Detail(
          day: "26/02",
          toalactual: "7.0",
          toalschedule: "8.0",
          elementdetail: [
            Elementdetail(
                description: "131 Collins St.",
                actual: "4.0",
                schedule: "4.0",
                time: "08:00am - 12:00pm"),
            Elementdetail(
                description: "131 Collins St.",
                actual: "0.0",
                schedule: "3.0",
                time: "08:00am - 12:00pm")
          ],
        ),
      ],
      notes: [
        Note(
            time: "08:00am - 12:00pm",
            day: "24 Feb 2021",
            description:
                "Overtime was completed on 14/02/21, make sure to pay the correct amount owed"),
        Note(
            time: "08:00am - 12:00pm",
            day: "23 Feb 2021",
            description:
                "Overtime was completed on 14/02/21, make sure to pay the correct amount owed")
      ],
      attachment: [
        Attachment(day: "23 Feb 2021", time: "08:00am - 12:00pm", file: [
          FileElement(file: "File.pdf"),
          FileElement(file: "File.pdf")
        ]),
        Attachment(
            day: "21 Feb 2021",
            time: "08:00am - 12:00pm",
            file: [FileElement(file: "File.pdf")])
      ]);

  @override
  void initState() {
    comments = TextEditingController(text: 'Enter Note');
    super.initState();
  }

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
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppMetrics.paddingContainer),
                    child: Text(
                      "New TimeSheet",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(flex: 1, child: Text(''))
            ],
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingVertical),
                padding: EdgeInsets.only(top: AppMetrics.paddingContent),
                colorBorder: AppColors.border,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal,
                          vertical: AppMetrics.paddingContent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items.infor.name,
                                style: AppTextStyles.textSize18(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                items.infor.manager,
                                style: AppTextStyles.textSize14(),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "Feb -Feb 28 2021",
                                style: AppTextStyles.textSize14(
                                    color: AppColors.greyColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.divider,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal,
                          vertical: AppMetrics.paddingContent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Total hours \nworked",
                              style: AppTextStyles.textSize16(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Scheduled",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.textSize12(
                                            color: AppColors.greyColor),
                                      ),
                                      Text(
                                        '40.0',
                                        style: AppTextStyles.textSize16(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: AppMetrics.paddingContainer,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Actual",
                                        style: AppTextStyles.textSize12(
                                            color: AppColors.greyColor),
                                      ),
                                      Text(
                                        '35.0',
                                        style: AppTextStyles.textSize16(
                                            color: AppColors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.divider,
                    ),
                    Container(
                      child: Column(
                        children: items.detail
                            .map((e) => Container(
                                  margin: EdgeInsets.only(
                                      top: AppMetrics.paddingContent),
                                  padding: EdgeInsets.only(
                                      top: AppMetrics.paddingContent),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppMetrics.paddingHorizotal),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                e.day,
                                                style: AppTextStyles.textSize16(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          e.toalschedule,
                                                          style: AppTextStyles
                                                              .textSize16(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: AppMetrics
                                                        .paddingContainer,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          e.toalactual,
                                                          style: AppTextStyles
                                                              .textSize16(
                                                                  color:
                                                                      AppColors
                                                                          .green,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppMetrics.paddingHorizotal),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                items.detail[0].elementdetail
                                                    .map((e) => Container(
                                                          margin: EdgeInsets.only(
                                                              top: AppMetrics
                                                                  .paddingContent),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                e.description,
                                                                style: AppTextStyles
                                                                    .textSize14(),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child: Text(
                                                                      e.time,
                                                                      style: AppTextStyles
                                                                          .textSize14(),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Text(
                                                                                e.schedule,
                                                                                style: AppTextStyles.textSize14(),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              AppMetrics.paddingContainer,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: AppColors.green,
                                                                                  ),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Text(
                                                                                  e.actual,
                                                                                  style: AppTextStyles.textSize14(color: AppColors.green),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ))
                                                    .toList()),
                                      ),
                                      items.detail.indexOf(e) ==
                                              items.detail.length - 1
                                          ? Container()
                                          : Divider(color: AppColors.divider),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Divider(
                      color: AppColors.divider,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppMetrics.paddingHorizotal,
                          right: AppMetrics.paddingHorizotal,
                          bottom: AppMetrics.paddingContent),
                      child: TextField(
                        style: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        controller: comments,
                        decoration: InputDecoration(
                            hintText: 'Enter Note',
                            labelStyle: AppTextStyles.textSize12(
                                color: AppColors.blueLight),
                            hintStyle: AppTextStyles.textSize18(
                                color: AppColors.blueLight),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            labelText: 'Comments'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppMetrics.paddingContent),
                        margin: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppTranslations()
                                  .getLanguage(context, 'attachment'),
                              style: AppTextStyles.textSize14(
                                  color: AppColors.blueLight),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImage.attAttachment,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Text(
                                  AppTranslations()
                                      .getLanguage(context, 'addAttachment'),
                                  style: AppTextStyles.textSize18(),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: AppMetrics.paddingContent,
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingVertical),
              child: Column(
                children: [
                  CustomButton(
                    ontap: () {},
                    color: AppColors.greenAccent,
                    borderColor: AppColors.greenAccent,
                    text: 'Submit',
                    height: MediaQuery.of(context).size.height * 0.07,
                    style: AppTextStyles.textSize16(),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  CustomButton(
                    ontap: () {},
                    borderColor: AppColors.greenAccent,
                    color: AppColors.whiteColor,
                    text: AppTranslations().getLanguage(context, 'saveAsDraft'),
                    height: MediaQuery.of(context).size.height * 0.07,
                    style: AppTextStyles.textSize16(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Delete",
                      style: AppTextStyles.textSize16(),
                    ),
                  ),
                  SizedBox(
                    height: AppMetrics.paddingContainer,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
