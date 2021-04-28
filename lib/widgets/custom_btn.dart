import 'package:flutter/material.dart';

import '../config/app_metrics.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Color color, borderColor;
  final String text;
  final double height, width;
  final Function ontap;
  final TextStyle style;
  CustomButton(
      {this.color,
      this.text,
      this.height,
      this.width,
      this.ontap,
      this.style,
      @required this.borderColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
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
