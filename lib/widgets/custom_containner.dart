import 'package:flutter/material.dart';

import '../config/app_metrics.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  final Color color;
  final double height, width;
  final Widget child;
  final EdgeInsets edgeInsets;
  final EdgeInsets padding;
  final Color colorBorder;
  CustomContainer(
      {this.color = Colors.white,
      this.child,
      this.edgeInsets,
      this.padding,
      this.height,
      @required this.colorBorder,
      this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      margin: this.edgeInsets,
      padding: this.padding,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: colorBorder),
          borderRadius: BorderRadius.circular(AppMetrics.borderContainer)),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
