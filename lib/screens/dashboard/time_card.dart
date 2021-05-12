import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TimeCard extends StatefulWidget {
  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  String _fileName;
  List<PlatformFile> _paths;
  String directoryPath;
  String _extension;
  bool loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController comments, location;
  TimeOfDay _time = TimeOfDay(hour: 4, minute: 33);
  DateTime _date;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    comments.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
            title: "My Time Card",
            style: AppTextStyles.textSize16(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.whiteColor
                    : AppColors.black),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: formTimeCard()),
          Expanded(
            flex: 2,
            child: Container(
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
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? AppColors.whiteColor
                                                  : AppColors.black),
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
                                                style: AppTextStyles.textSize16(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? AppColors.whiteColor
                                                        : AppColors.black),
                                              ),
                                              WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: SvgPicture.asset(
                                                      AppImage.draft)),
                                              TextSpan(
                                                text: " or ",
                                                style: AppTextStyles.textSize16(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? AppColors.whiteColor
                                                        : AppColors.black),
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
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? AppColors.green
                                                    : AppColors.border),
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.green
                                            : AppColors.whiteColor,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Day Total",
                                              style: AppTextStyles.textSize12(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.greyColor),
                                            ),
                                            Text(
                                              "1h12m",
                                              style: AppTextStyles.textSize18(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.green),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          color: AppColors.dividerVetical,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Start",
                                              style: AppTextStyles.textSize12(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.greyColor),
                                            ),
                                            Text(
                                              "3:00pm",
                                              style: AppTextStyles.textSize18(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.greyColor),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          color: AppColors.dividerVetical,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "End",
                                              style: AppTextStyles.textSize12(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.greyColor),
                                            ),
                                            Text(
                                              "4:12pm",
                                              style: AppTextStyles.textSize18(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.greyColor),
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
                    style: AppTextStyles.textSize18(color: AppColors.greyColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget formTimeCard() {
    return CustomContainer(
      edgeInsets: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingContainer),
      colorBorder: AppColors.border,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppMetrics.paddingHorizotal,
            ),
            CustomContainer(
              edgeInsets:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              colorBorder: AppColors.green,
              color: AppColors.green,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
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
            SizedBox(
              height: AppMetrics.paddingVertical,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Time",
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
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.whiteColor
                                            : AppColors.blueLight),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: _selectDate,
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
                  ),
                  SizedBox(
                    width: AppMetrics.paddingHorizotal,
                  ),
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
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
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.whiteColor
                                          : AppColors.blueLight),
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
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
                child: TextField(
                  style: AppTextStyles.textSize18(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.blueLight),
                  controller: location,
                  decoration: InputDecoration(
                      suffixIcon: Image.asset(
                        AppImage.search,
                        height: 18.0,
                        width: 18.0,
                      ),
                      hintText: 'Add Location',
                      labelStyle: AppTextStyles.textSize12(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight),
                      hintStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.blueLight),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blueLight),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green),
                      ),
                      labelText: 'Location'),
                )),
            SizedBox(
              height: AppMetrics.paddingContent,
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
                child: TextField(
                  style: AppTextStyles.textSize18(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.blueLight),
                  controller: comments,
                  decoration: InputDecoration(
                      hintText: 'Enter Note',
                      labelStyle: AppTextStyles.textSize12(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight),
                      hintStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.blueLight),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blueLight),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green),
                      ),
                      labelText: 'Comments'),
                )),
            SizedBox(
              height: AppMetrics.paddingContent,
            ),
            if (_fileName != null)
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingContainer,
                      vertical: AppMetrics.paddingContent),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          AppImage.paperclip,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        _fileName,
                        style: AppTextStyles.textSize14(
                            color: AppColors.greyColor),
                      ),
                    ],
                  )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer,
                    vertical: AppMetrics.paddingContent),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _openFileExplorer,
                      child: SvgPicture.asset(
                        AppImage.attAttachment,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      AppTranslations().getLanguage(context, 'addAttachment'),
                      style: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.black),
                    ),
                  ],
                )),
            SizedBox(
              height: AppMetrics.paddingContainer,
            )
          ],
        ),
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
        _date = newDate;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.greenAccent,
              onPrimary: Colors.white,
            ),
          ),
          child: child,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void _openFileExplorer() async {
    setState(() => loadingPath = true);
    try {
      directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on Exception catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      loadingPath = false;
      print(_paths.first.extension);
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
      print(_fileName);
    });
  }
}
