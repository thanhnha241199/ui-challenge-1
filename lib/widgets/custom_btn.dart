import 'package:bookkeepa/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../config/app_metrics.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color color;
  String text;
  double height, width;
  Function ontap;
  TextStyle style;
  CustomButton(
      {this.color, this.text, this.height, this.width, this.ontap, this.style});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greenAccent),
            color: color,
            borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
