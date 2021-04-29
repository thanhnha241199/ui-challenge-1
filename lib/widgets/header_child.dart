import 'package:bookkeepa/config/app_metrics.dart';
import 'package:flutter/material.dart';

class HeaderChild extends StatelessWidget {
  final bool showLeftIcon;
  final Widget leftIcon;
  final String title;
  final TextStyle style;
  final Function onPressLeftIcon;
  final Widget rightIcon;

  const HeaderChild(
      {Key key,
      this.showLeftIcon = true,
      this.leftIcon,
      this.title,
      this.style,
      this.onPressLeftIcon,
      this.rightIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showLeftIcon
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      onPressLeftIcon ?? Navigator.pop(context);
                    },
                    child: Container(
                      child: leftIcon,
                      padding:
                          EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                    ))
                : Text(''),
            Expanded(
                child: Center(
                    child: Text(
                  title,
                  style: style,
                )),
                flex: 1),
            rightIcon ?? Text(''),
          ],
        ));
  }
}
