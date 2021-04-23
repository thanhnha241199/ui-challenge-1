import 'package:flutter/material.dart';

import '../config/app_metrics.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final EdgeInsets edgeInsets;
  CustomContainer({this.color = Colors.white, this.child, this.edgeInsets});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      padding: EdgeInsets.only(top: AppMetrics.paddingContent),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppMetrics.borderContainer)),
      child: child,
    );
  }
}
