import 'package:bookkeepa/config/app_colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String title;

  const ElevatedButtonCustom(
      {Key key,
      this.onPressed,
      this.color = AppColors.turquoiseColor,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ))),
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: double.infinity,
        child: Center(child: Text(title)),
      ),
    );
  }
}
