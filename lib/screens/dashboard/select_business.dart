import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
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
    BusinessModel(title: "Telsta", subtitle: "Address Info (get from Xero)"),
    BusinessModel(title: "Kmart", subtitle: "Address Info (get from Xero)"),
    BusinessModel(title: "Autodesk", subtitle: "Address Info (get from Xero)"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: "Select Another Business",
              style: AppTextStyles.textSize16(),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: Column(
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
                height: MediaQuery.of(context).size.height * 0.07,
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
    );
  }

  _getBody() {
    return items.map((e) {
      return items.indexOf(e) == 0
          ? CustomContainer(
              width: MediaQuery.of(context).size.width,
              edgeInsets: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent - 2),
              padding: EdgeInsets.symmetric(
                  vertical: AppMetrics.paddingVertical,
                  horizontal: AppMetrics.paddingHorizotal),
              colorBorder: AppColors.greenAccent,
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: AppTextStyles.textSize18(),
                        ),
                        Text(
                          e.subtitle,
                          style: AppTextStyles.textSize14(),
                        )
                      ]),
                ],
              ))
          : CustomContainer(
              width: MediaQuery.of(context).size.width,
              edgeInsets: EdgeInsets.symmetric(
                  horizontal: AppMetrics.paddingHorizotal,
                  vertical: AppMetrics.paddingContent - 2),
              padding: EdgeInsets.symmetric(
                  vertical: AppMetrics.paddingVertical,
                  horizontal: AppMetrics.paddingHorizotal),
              colorBorder: AppColors.grey.withOpacity(0.2),
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
                    width: AppMetrics.paddingHorizotal,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: AppTextStyles.textSize18(),
                        ),
                        Text(
                          e.subtitle,
                          style: AppTextStyles.textSize14(),
                        )
                      ]),
                ],
              ));
    });
  }
}
