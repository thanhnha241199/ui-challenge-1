import 'dart:ui';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title, descriptions;

  const CustomDialog({this.title, this.descriptions}) : super();

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: AppTextStyles.textSize25(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: AppTextStyles.textSize14(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      NavigationService.instance.goback();
                    },
                    child: Text(
                      "Close",
                      style: AppTextStyles.textSize14(),
                    )),
              ),
            ],
          ),
        ),
        // Positioned(
        //     left: 10,
        //     right: 10,
        //     child: CircleAvatar(
        //         backgroundColor: Colors.transparent,
        //         radius: 10,
        //         child: Container(
        //           child: Text('zxczxc'),
        //         ))),
      ],
    );
  }
}
