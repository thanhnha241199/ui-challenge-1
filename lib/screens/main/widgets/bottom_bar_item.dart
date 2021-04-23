import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  final String imgUrl;
  final double width;
  final Color color;
  const BottomBarItem({Key key, this.imgUrl, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.0),
      child: SvgPicture.asset(
        imgUrl,
        width: width,
        height: 22.0,
        color: color,
      ),
    );
  }
}
