import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OverlayLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Container(
            color: Colors.black,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitSquareCircle(color: Colors.white),
            SizedBox(
              height: AppMetrics.paddingContainer,
            ),
            Center(
              child: Text(
                'Loading....',
                style: AppTextStyles.textSize14(color: AppColors.whiteColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
