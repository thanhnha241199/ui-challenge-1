import 'package:bookkeepa/config/app_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final bool autofocus;
  final String title;
  final String hinttitle;
  final TextStyle style;
  final TextStyle textStyle;
  final TextStyle textStyleHint;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final EdgeInsets padding;
  final IconData icon;
  final Function onTapIcon;
  final Function validator;
  InputField({
    Key key,
    this.title,
    this.hinttitle,
    this.isPassword = false,
    this.style,
    this.padding,
    this.textStyle,
    this.textStyleHint,
    this.textInputType,
    this.textInputAction,
    this.validator,
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
  void dispose() {
    widget.controller?.dispose();
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: widget.padding,
        child: TextFormField(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword ? !isEnable : isEnable,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete,
          style: widget.style,
          validator: widget.validator,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
              labelText: widget.title,
              hintText: widget.hinttitle,
              labelStyle: widget.textStyle,
              hintStyle: widget.textStyleHint,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              filled: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey10),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.greenAccent),
              ),
              suffixIcon: widget.icon is IconData
                  ? GestureDetector(
                      onTap: () {
                        _onTap();
                      },
                      child: Container(
                        child: Icon(
                          widget.icon,
                          color: isEnable ? Colors.green : Colors.grey,
                        ),
                      ),
                    )
                  : null),
        ),
      ),
    );
  }
}
