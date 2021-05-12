import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
  final List<String> items = <String>[
    "Select Leave type",
    'Select Leave type 2',
    'Select Leave type 3',
    'Select Leave type 4',
    'Select Leave type 5'
  ];
  String selectedItem = "Select Leave type";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Option 1"),
    OptionItem(id: "2", title: "Option 2")
  ]);
  OptionItem optionItemSelected =
      OptionItem(id: null, title: "Chọn quyền truy cập");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: HeaderView(
            color: Colors.transparent,
            child: HeaderChild(
                title: "New Leave Request",
                style: AppTextStyles.textSize16(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.black),
                leftIcon: SvgPicture.asset(AppImage.arrow_back))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 3, child: formLeaveRequest()),
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
                                  vertical: 30.0,
                                  horizontal: AppMetrics.paddingHorizotal),
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(flex: 2, child: Text("")),
                                        Expanded(
                                            flex: 5,
                                            child: Text(
                                              "Leave Requested",
                                              style: AppTextStyles.textSize18(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.black),
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
                                    SizedBox(
                                      height: 38.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppMetrics.paddingHorizotal),
                                      child: Text(
                                        "Your leave request has been submitted. You will be notified once your employer Approves or rejects it.",
                                        style: AppTextStyles.textSize16(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? AppColors.whiteColor
                                                    : AppColors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24.0,
                                    ),
                                    Column(
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
                                                    style: AppTextStyles.textSize16(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors.black),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "8 Feb - 12 2021 (36.5hrs)",
                                                    style: AppTextStyles.textSize12(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors.black),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Doctor's Appointment",
                                                    style: AppTextStyles.textSize12(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors.black),
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
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    CustomButton(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      ontap: () {
                                        NavigationService.instance.goback();
                                      },
                                      borderColor: AppColors.greenAccent,
                                      color: AppColors.greenAccent,
                                      text: "Close",
                                      style: AppTextStyles.textSize14(),
                                    )
                                  ],
                                ),
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
                      style:
                          AppTextStyles.textSize14(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget formLeaveRequest() {
    return CustomContainer(
        colorBorder: AppColors.border,
        edgeInsets: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SelectDropList(
              //   this.optionItemSelected,
              //   this.dropListModel,
              //   (optionItem) {
              //     optionItemSelected = optionItem;
              //     setState(() {});
              //   },
              // ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  selectedItemBuilder: (BuildContext context) {
                    return items.map((String item) {
                      return Text(item);
                    }).toList();
                  },
                  items: items
                      .map((label) => DropdownMenuItem(
                            child: Row(
                              children: [
                                Text(label.toString()),
                                Spacer(),
                                label == selectedItem
                                    ? SvgPicture.asset(
                                        AppImage.caretdown,
                                        alignment: Alignment.center,
                                      )
                                    : Container()
                              ],
                            ),
                            value: label,
                          ))
                      .toList(),
                  value: selectedItem,
                  style: AppTextStyles.textSize18(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.blueLight),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(
                              AppMetrics.borderContainer)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey10),
                      ),
                      labelText: 'Leave Type',
                      hintText: 'Select Leave type',
                      hintStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.blueLight),
                      labelStyle: AppTextStyles.textSize12(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight)),
                  icon: SvgPicture.asset(
                    AppImage.caretdown,
                    alignment: Alignment.center,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                ),
              ),
              InputField(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
                onEditingComplete: () {},
                title: 'Leave Description',
                hinttitle: 'Add Description',
                style: AppTextStyles.textSize18(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.black),
                textStyleHint:
                    AppTextStyles.textSize18(color: AppColors.blueLight),
                textStyle: AppTextStyles.textSize18(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.colorText
                        : AppColors.blueLight),
                textInputAction: TextInputAction.done,
                controller: description,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: GestureDetector(
                    onTap: _selectDateFrom,
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
                                dateFrom == null
                                    ? "From"
                                    : DateFormat('dd/MM/yyyy').format(dateFrom),
                                style: AppTextStyles.textSize20(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.whiteColor
                                        : AppColors.blueLight)),
                            Spacer(),
                            SvgPicture.asset(
                              AppImage.calendar,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.dividerDark
                              : AppColors.divider,
                        ),
                      ],
                    ),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: GestureDetector(
                    onTap: _selectDateTo,
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
                              dateTo == null
                                  ? "To"
                                  : DateFormat('dd/MM/yyyy').format(dateTo),
                              style: AppTextStyles.textSize20(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.blueLight),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              AppImage.calendar,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.dividerDark
                              : AppColors.divider,
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingContainer),
                child: Text(
                  "Hours(optional)",
                  style: AppTextStyles.textSize12(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.whiteColor
                          : AppColors.blueLight),
                ),
              ),
              SizedBox(
                height: AppMetrics.paddingContainer / 2,
              ),
              CustomContainer(
                  edgeInsets: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingContainer),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMetrics.paddingHorizontalContainer,
                      vertical: AppMetrics.paddingHorizontalContainer - 2),
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
                              "0hr",
                              style: AppTextStyles.textSize16(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.blueLight),
                            )
                          ],
                        )),
                  ])),
              SizedBox(
                height: AppMetrics.paddingContainer,
              ),
            ],
          ),
        ));
  }

  void _selectDateFrom() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
        dateTo = newDate;
      });
    }
  }
}

class DropListModel {
  DropListModel(this.listOptionItems);

  final List<OptionItem> listOptionItems;
}

class OptionItem {
  final String id;
  final String title;

  OptionItem({@required this.id, @required this.title});
}

class SelectDropList extends StatefulWidget {
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final Function(OptionItem optionItem) onOptionSelected;

  SelectDropList(this.itemSelected, this.dropListModel, this.onOptionSelected);

  @override
  _SelectDropListState createState() =>
      _SelectDropListState(itemSelected, dropListModel);
}

class _SelectDropListState extends State<SelectDropList>
    with SingleTickerProviderStateMixin {
  OptionItem optionItemSelected;
  final DropListModel dropListModel;

  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  _SelectDropListState(this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            decoration: BoxDecoration(
              color: isShow ? Colors.red : Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                isShow
                    ? Expanded(
                        child: GestureDetector(
                            onTap: () {
                              this.isShow = !this.isShow;
                              _runExpandCheck();
                              setState(() {});
                            },
                            child: Text(
                              optionItemSelected.title,
                              style: AppTextStyles.textSize16(),
                            )))
                    : Expanded(
                        child: GestureDetector(
                            onTap: () {
                              this.isShow = !this.isShow;
                              _runExpandCheck();
                              setState(() {});
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Leave Type",
                                  style: AppTextStyles.textSize12(),
                                ),
                                Text(
                                  optionItemSelected.title,
                                  style: AppTextStyles.textSize16(),
                                ),
                              ],
                            ))),
                Align(
                    alignment: Alignment(1, 0),
                    child: isShow
                        ? SvgPicture.asset(
                            AppImage.caretup,
                            alignment: Alignment.center,
                          )
                        : SvgPicture.asset(
                            AppImage.caretdown,
                            alignment: Alignment.center,
                          )),
              ],
            ),
          ),
          SizedBox(
            height: AppMetrics.paddingContainer / 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Divider(
              height: 2,
              color: AppColors.divider,
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: _buildDropListOptions(
                      dropListModel.listOptionItems, context))),
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.optionItemSelected = item;
        isShow = false;
        expandController.reverse();
        widget.onOptionSelected(item);
      },
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingContainer),
              child: Text(
                item.title,
                style: AppTextStyles.textSize16(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
