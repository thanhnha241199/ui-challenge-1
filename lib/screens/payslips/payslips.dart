import 'dart:math';
import 'dart:ui';

import 'package:bookkeepa/models/payslip/payslip.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/screens/payslips/viewpayslips.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';

class Payslips extends StatefulWidget {
  @override
  _PayslipsState createState() => _PayslipsState();
}

class _PayslipsState extends State<Payslips> with TickerProviderStateMixin {
  List<PayslipModel> items = [
    PayslipModel(start: "01 Feb", end: "22 Feb 2021", amount: "1,953.00"),
    PayslipModel(start: "02 Feb", end: "23 Feb 2021", amount: "1,952.00"),
    PayslipModel(start: "03 Feb", end: "23 Feb 2021", amount: "1,951.00"),
    PayslipModel(start: "04 Feb", end: "24 Feb 2021", amount: "1,959.00"),
    PayslipModel(start: "05 Feb", end: "25 Feb 2021", amount: "1,955.00")
  ];
  bool date = false;
  bool amount = false;
  Animation _arrowAnimationAmount, _arrowAnimationDate;
  AnimationController _arrowAnimationAmountController,
      _arrowAnimationDateController;
  @override
  void initState() {
    _arrowAnimationAmountController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimationAmount =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationAmountController);
    _arrowAnimationDateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimationDate =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationDateController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HeaderView(
            color: Colors.transparent,
            child: HeaderChild(
                title: AppTranslations().getLanguage(context, 'myPayslip'),
                style: AppTextStyles.textSize16(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.black),
                rightIcon: GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: '',
                        barrierColor: Colors.black38,
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (ctx, anim1, anim2) {
                          return Notifications();
                        },
                        transitionBuilder: (ctx, anim1, anim2, child) =>
                            BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 30 * anim1.value,
                              sigmaY: 30 * anim1.value),
                          child: FadeTransition(
                            child: child,
                            opacity: anim1,
                          ),
                        ),
                        context: context,
                      );
                    },
                    child: SvgPicture.asset(AppImage.notification)))),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppMetrics.paddingContainer,
                  horizontal: AppMetrics.paddingHorizotal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dropdownDate(),
                  SizedBox(
                    width: 10.0,
                  ),
                  dropdownAmount()
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                edgeInsets: EdgeInsets.only(
                    left: AppMetrics.paddingHorizotal,
                    right: AppMetrics.paddingHorizotal),
                padding: EdgeInsets.only(top: AppMetrics.paddingContent),
                colorBorder: AppColors.border,
                child: AppListView(
                  data: items,
                  renderItem: (item) {
                    return renderItem(context, item);
                  },
                  onLoadMore: () {
                    print('loadmore');
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FancyFab(),
      ),
    );
  }

  Widget dropdownAmount() {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            amount = !amount;
            amount
                ? items.sort((a, b) => a.amount.compareTo(b.amount))
                : items.sort((a, b) => -a.amount.compareTo(b.amount));
          });
          _arrowAnimationAmountController.isCompleted
              ? _arrowAnimationAmountController.reverse()
              : _arrowAnimationAmountController.forward();
        },
        child: CustomContainer(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.45,
          padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingVerticalContainer),
          colorBorder: AppColors.border,
          child: Row(
            children: [
              Text(
                AppTranslations().getLanguage(context, 'amount'),
                style: AppTextStyles.textSize16(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.black),
              ),
              Spacer(),
              AnimatedBuilder(
                animation: _arrowAnimationAmountController,
                builder: (context, child) => Transform.rotate(
                    angle: _arrowAnimationAmount.value,
                    child: SvgPicture.asset(
                      AppImage.caretdown,
                      alignment: Alignment.center,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropdownDate() {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            date = !date;

            amount
                ? items.sort((a, b) => a.end.compareTo(b.end))
                : items.sort((a, b) => -a.end.compareTo(b.end));
          });
          _arrowAnimationDateController.isCompleted
              ? _arrowAnimationDateController.reverse()
              : _arrowAnimationDateController.forward();
        },
        child: CustomContainer(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.45,
          padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingVerticalContainer),
          colorBorder: AppColors.border,
          child: Row(
            children: [
              Text(
                AppTranslations().getLanguage(context, 'date'),
                style: AppTextStyles.textSize16(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.black),
              ),
              Spacer(),
              AnimatedBuilder(
                animation: _arrowAnimationDateController,
                builder: (context, child) => Transform.rotate(
                    angle: _arrowAnimationDate.value,
                    child: SvgPicture.asset(
                      AppImage.caretdown,
                      alignment: Alignment.center,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderItem(BuildContext context, PayslipModel item) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingVerticalContainer,
              vertical: AppMetrics.paddingContent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.end,
                    style: AppTextStyles.textSize16(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$${item.amount}",
                    style: AppTextStyles.textSize16(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "${item.start} - ${item.end}",
                style: AppTextStyles.textSize12(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.greyColor),
              ),
              SizedBox(
                height: AppMetrics.paddingContainer,
              ),
              CustomButton(
                ontap: () {
                  NavigationService.instance
                      .pushPage(context, false, ViewPayslip());
                },
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.black300
                    : AppColors.whiteColor,
                borderColor: AppColors.greenAccent,
                text: AppTranslations().getLanguage(context, 'viewPdf'),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.3,
                style: AppTextStyles.textSize14(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.greenAccent
                        : AppColors.green),
              ),
            ],
          ),
        ),
        items.indexOf(item) == items.length - 1
            ? Container()
            : Divider(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.dividerDark
                    : AppColors.divider,
              ),
      ],
    );
  }
}
