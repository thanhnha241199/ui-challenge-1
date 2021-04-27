import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
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
          height: 90.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppMetrics.paddingVertical),
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
                        height: 21.0,
                        width: 11.0,
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Select Another Business",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    )),
                Expanded(flex: 1, child: Text(''))
              ],
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ..._getBody(),
              SizedBox(
                height: 18.0,
              ),
              CustomButton(
                ontap: () {},
                color: AppColors.greenAccent,
                text: 'Add New Business',
                height: MediaQuery.of(context).size.height * 0.09,
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
              color: AppColors.greenAccent,
              text: 'Change Business',
              height: MediaQuery.of(context).size.height * 0.1,
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
                  vertical: AppMetrics.paddingContent),
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
                  vertical: AppMetrics.paddingContent),
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
              ));
    });
  }
}
