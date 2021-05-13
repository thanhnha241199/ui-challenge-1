import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/bottom_space.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';

class ViewPayslip extends StatefulWidget {
  @override
  _ViewPayslipState createState() => _ViewPayslipState();
}

class _ViewPayslipState extends State<ViewPayslip> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: "28 Feb 2021",
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset(
            AppImage.invoice,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Column(
              children: [
                CustomButton(
                  height: MediaQuery.of(context).size.height * 0.08,
                  ontap: () {},
                  borderColor: AppColors.greenAccent,
                  color: AppColors.greenAccent,
                  text: AppTranslations().getLanguage(context, 'download'),
                  style: AppTextStyles.textSize18(),
                ),
                SizedBox(
                  height: AppMetrics.paddingContainer,
                ),
                CustomButton(
                  height: MediaQuery.of(context).size.height * 0.08,
                  ontap: () {
                    Share.share('123');
                  },
                  borderColor: AppColors.greenAccent,
                  color: AppColors.whiteColor,
                  text: AppTranslations().getLanguage(context, 'share'),
                  style: AppTextStyles.textSize18(color: AppColors.greyColor),
                ),
                BottomSpace(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
