import 'package:bookkeepa/models/payslip/payslip.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
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
  bool date = false;
  bool amount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
        height: 94.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingHorizotal,
              vertical: AppMetrics.paddingVertical),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("")),
              Expanded(
                  flex: 4,
                  child: Text(
                    "My ${AppTranslations().getLanguage(context, 'payslips')}",
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
      ),
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
        width: MediaQuery.of(context).size.width * 0.44,
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
        width: MediaQuery.of(context).size.width * 0.44,
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
            ontap: () {},
            color: AppColors.whiteColor,
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
