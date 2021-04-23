import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Container(
            color: Colors.black,
          ),
        ),
        Center(
          child: Text(
            'Loading....',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
