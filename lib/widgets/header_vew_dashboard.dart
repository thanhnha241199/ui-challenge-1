import 'package:bookkeepa/config/app_metrics.dart';
import 'package:flutter/material.dart';

class HeaderView extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;
  HeaderView(
      {this.child,
      this.height = AppMetrics.heightHeader,
      this.color = Colors.transparent});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
          color: color,
          child: SafeArea(
            child: child ?? Container(),
          )),
    );
  }
}
