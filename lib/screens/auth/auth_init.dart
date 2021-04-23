import 'package:bookkeepa/blocs/auth/auth_bloc.dart';
import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthInit extends StatefulWidget {
  @override
  _AuthInitState createState() => _AuthInitState();
}

class _AuthInitState extends State<AuthInit> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthInitLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Center(
          child: SvgPicture.asset(
            AppImage.logo,
            width: 64.46,
            height: 64.46,
          ),
        ));
  }
}
