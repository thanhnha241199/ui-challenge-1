import 'dart:ui';

import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/models/payslip/payslip.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/screens/payslips/viewpayslips.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
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

class _PayslipsState extends State<Payslips> {
  List<PayslipModel> items = [
    PayslipModel(start: "01 Feb", end: "28 Feb 2021", amount: "1,956.00"),
    PayslipModel(start: "01 Feb", end: "28 Feb 2021", amount: "1,956.00"),
    PayslipModel(start: "01 Feb", end: "28 Feb 2021", amount: "1,956.00"),
    PayslipModel(start: "01 Feb", end: "28 Feb 2021", amount: "1,956.00"),
    PayslipModel(start: "01 Feb", end: "28 Feb 2021", amount: "1,956.00")
  ];
  List<NotificationModel> notification = [
    NotificationModel(
        title: "Jack Hihnson requested leave", read: true, time: "1m ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: true,
        time: "20m ago"),
    NotificationModel(
        title: "1 document needs to be signed", read: false, time: "1h ago"),
    NotificationModel(
        title: "Amy Ranch needs timesheet approved",
        read: false,
        time: "5h ago"),
    NotificationModel(
        title: "Cornor Halt requested leave", read: false, time: "10h ago"),
    NotificationModel(
        title: "Joseph Rosso needs timesheet approved",
        read: false,
        time: "1d ago"),
    NotificationModel(
        title: "3 documents needs to be signed", read: false, time: "1d ago"),
  ];
  bool date = false;
  bool amount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: "My ${AppTranslations().getLanguage(context, 'payslips')}",
              style: AppTextStyles.textSize16(),
              rightIcon: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black38,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (ctx, anim1, anim2) {
                        return Notifications(
                          items: notification,
                        );
                      },
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 30 * anim1.value, sigmaY: 30 * anim1.value),
                        child: FadeTransition(
                          child: child,
                          opacity: anim1,
                        ),
                      ),
                      context: context,
                    );
                  },
                  child: SvgPicture.asset(AppImage.notification)))),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: AppMetrics.paddingVertical,
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
          CustomContainer(
            edgeInsets: EdgeInsets.only(
                top: 100.0,
                left: AppMetrics.paddingHorizotal,
                right: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.only(top: AppMetrics.paddingContent),
            colorBorder: AppColors.grey.withOpacity(0.2),
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
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }

  Widget dropdownAmount() {
    return GestureDetector(
      onTap: () {
        setState(() {
          amount = !amount;
        });
      },
      child: CustomContainer(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.43,
        padding: EdgeInsets.symmetric(horizontal: AppMetrics.paddingContent),
        colorBorder: AppColors.grey.withOpacity(0.2),
        child: Row(
          children: [
            Text(
              AppTranslations().getLanguage(context, 'amount'),
              style: AppTextStyles.textSize16(),
            ),
            Spacer(),
            amount == false
                ? SvgPicture.asset(
                    AppImage.caretdown,
                    alignment: Alignment.center,
                  )
                : SvgPicture.asset(
                    AppImage.caretup,
                    alignment: Alignment.center,
                  ),
          ],
        ),
      ),
    );
  }

  Widget dropdownDate() {
    return GestureDetector(
      onTap: () {
        setState(() {
          date = !date;
        });
      },
      child: CustomContainer(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.43,
        padding: EdgeInsets.symmetric(horizontal: AppMetrics.paddingContent),
        colorBorder: AppColors.grey.withOpacity(0.2),
        child: Row(
          children: [
            Text(
              AppTranslations().getLanguage(context, 'date'),
              style: AppTextStyles.textSize16(),
            ),
            Spacer(),
            date == false
                ? SvgPicture.asset(
                    AppImage.caretdown,
                    alignment: Alignment.center,
                  )
                : SvgPicture.asset(
                    AppImage.caretup,
                    alignment: Alignment.center,
                  ),
          ],
        ),
      ),
    );
  }

  Widget renderItem(BuildContext context, PayslipModel item) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingContent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                item.end,
                style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "\$${item.amount}",
                style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "${item.start} - ${item.end})",
            style: AppTextStyles.textSize12(),
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomButton(
            ontap: () {
              NavigationService.instance
                  .pushPage(context, false, ViewPayslip());
            },
            color: AppColors.whiteColor,
            borderColor: AppColors.greenAccent,
            text: AppTranslations().getLanguage(context, 'viewpdf'),
            height: MediaQuery.of(context).size.height * 0.065,
            width: MediaQuery.of(context).size.width * 0.3,
            style: AppTextStyles.textSize14(color: AppColors.green),
          ),
        ],
      ),
    );
  }
}
