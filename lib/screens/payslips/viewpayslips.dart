import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPayslip extends StatefulWidget {
  @override
  _ViewPayslipState createState() => _ViewPayslipState();
}

class _ViewPayslipState extends State<ViewPayslip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
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
                  alignment: Alignment.center,
                  height: 21.0,
                  width: 11.0,
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMetrics.paddingContainer),
                  child: Text(
                    "28 Feb 2021",
                    style: AppTextStyles.textSize16(),
                    textAlign: TextAlign.center,
                  ),
                )),
            Expanded(flex: 1, child: Text(''))
          ],
        ),
      ),
    );
  }
}
