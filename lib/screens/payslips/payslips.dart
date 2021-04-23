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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
        height: 90.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Text("")),
            Expanded(
                flex: 4,
                child: Text(
                  "My payslips",
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.42,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Text(
                        "Date",
                        style: AppTextStyles.textSize16(),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppImage.caretdown,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.42,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Text(
                        "Amount",
                        style: AppTextStyles.textSize16(),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppImage.caretdown,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomContainer(
            edgeInsets:
                EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "28 February 2021",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "\$1,956.00",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "01 Feb - 28 Feb 2021)",
                        style: AppTextStyles.textSize12(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomButton(
                        ontap: () {},
                        color: AppColors.whiteColor,
                        text: "View PDF",
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        style: AppTextStyles.textSize14(),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "28 February 2021",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "\$1,956.00",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "01 Feb - 28 Feb 2021)",
                        style: AppTextStyles.textSize12(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomButton(
                        ontap: () {},
                        color: AppColors.whiteColor,
                        text: "View PDF",
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        style: AppTextStyles.textSize14(),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "28 February 2021",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "\$1,956.00",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "01 Feb - 28 Feb 2021)",
                        style: AppTextStyles.textSize12(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomButton(
                        ontap: () {},
                        color: AppColors.whiteColor,
                        text: "View PDF",
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        style: AppTextStyles.textSize14(),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "28 February 2021",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "\$1,956.00",
                            style: AppTextStyles.textSize16(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "01 Feb - 28 Feb 2021)",
                        style: AppTextStyles.textSize12(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomButton(
                        ontap: () {},
                        color: AppColors.whiteColor,
                        text: "View PDF",
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        style: AppTextStyles.textSize14(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }
}
