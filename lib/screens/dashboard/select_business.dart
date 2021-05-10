import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectBusiness extends StatefulWidget {
  @override
  _SelectBusinessState createState() => _SelectBusinessState();
}

class _SelectBusinessState extends State<SelectBusiness> {
  List<BusinessModel> items = [
    BusinessModel(
        title: "Telsta",
        subtitle: "Address Info (get from Xero)",
        select: true),
    BusinessModel(
        title: "Kmart",
        subtitle: "Address Info (get from Xero)",
        select: false),
    BusinessModel(
        title: "Autodesk",
        subtitle: "Address Info (get from Xero)",
        select: false),
    BusinessModel(
        title: "Telsta",
        subtitle: "Address Info (get from Xero)",
        select: false),
    BusinessModel(
        title: "Kmart",
        subtitle: "Address Info (get from Xero)",
        select: false),
    BusinessModel(
        title: "Autodesk",
        subtitle: "Address Info (get from Xero)",
        select: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: "Select Another Business",
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ..._getBody(),
                SizedBox(
                  height: AppMetrics.paddingContainer,
                ),
                CustomButton(
                  ontap: () {},
                  borderColor: AppColors.greenAccent,
                  color: AppColors.greenAccent,
                  text: 'Add New Business',
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.6,
                  style: AppTextStyles.textSize16(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingVertical),
              child: CustomButton(
                ontap: () {},
                borderColor: AppColors.greenAccent,
                color: AppColors.greenAccent,
                text: 'Change Business',
                height: MediaQuery.of(context).size.height * 0.08,
                style: AppTextStyles.textSize16(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBody() {
    return items.map((e) {
      return GestureDetector(
        onTap: () {
          items.forEach((element) {
            setState(() {
              element.select = false;
            });
          });
          setState(() {
            e.select = true;
          });
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              right: AppMetrics.paddingHorizotal,
              left: AppMetrics.paddingHorizotal,
              top: AppMetrics.paddingContainer,
            ),
            padding: EdgeInsets.symmetric(
                vertical: AppMetrics.paddingContainer,
                horizontal: AppMetrics.paddingContainer),
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.black300
                    : AppColors.whiteColor,
                border: Border.all(
                    color: e.select
                        ? AppColors.greenAccent
                        : Theme.of(context).brightness == Brightness.dark
                            ? AppColors.black300
                            : AppColors.border),
                borderRadius:
                    BorderRadius.circular(AppMetrics.borderContainer)),
            child: Row(
              children: [
                Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImage.business,
                  ),
                ),
                SizedBox(
                  width: 28.0,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    e.title,
                    style: AppTextStyles.textSize18(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  ),
                  Text(
                    e.subtitle,
                    style: AppTextStyles.textSize14(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  )
                ]),
              ],
            )),
      );
    });
  }
}
