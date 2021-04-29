import 'package:bookkeepa/config/app_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final bool autofocus;
  final String title;
  final TextStyle textStyle;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final IconData icon;
  final Function onTapIcon;
  InputField({
    Key key,
    this.title,
    this.isPassword = false,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.controller,
    this.icon,
    this.autofocus = false,
    this.onEditingComplete,
    this.focusNode,
    this.onTapIcon,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isEnable = false;

  void _onTap() {
    setState(() {
      isEnable = !isEnable;
    });
    print(widget.onTapIcon);
    if (widget.onTapIcon != null) {
      widget.onTapIcon(!isEnable);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TextFormField(
              focusNode: widget.focusNode,
              autofocus: widget.autofocus,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: widget.isPassword,
              textInputAction: widget.textInputAction,
              onEditingComplete: widget.onEditingComplete,
              decoration: InputDecoration(
                  labelText: widget.title,
                  labelStyle: TextStyle(color: AppColors.blackColor),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  filled: true,
                  suffixIcon: widget.icon is IconData
                      ? GestureDetector(
                          onTap: () {
                            _onTap();
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 25),
                            child: Icon(
                              widget.icon,
                              color: isEnable ? Colors.green : Colors.grey,
                            ),
                          ),
                        )
                      : null),
            ),
          ),
        ));
  }
}
