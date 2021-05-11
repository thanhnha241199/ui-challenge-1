import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/bottom_space.dart';
import 'package:bookkeepa/widgets/custom_dialog.dart';
import 'package:bookkeepa/widgets/elevated_button_custom.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController controllerCode;
  TextEditingController controllerNewPassword;
  TextEditingController controllerConfirmPassword;
  FocusNode fnCode;
  FocusNode fnNewPassword;
  FocusNode fnConfirmNewPassword;

  @override
  void initState() {
    super.initState();
    controllerCode = TextEditingController(text: '123456');
    controllerNewPassword = TextEditingController(text: '12345678');
    controllerConfirmPassword = TextEditingController(text: '12345678');
    fnCode = FocusNode();
    fnNewPassword = FocusNode();
    fnConfirmNewPassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    controllerCode.dispose();
    controllerNewPassword.dispose();
    controllerConfirmPassword.dispose();
    fnCode.dispose();
    fnNewPassword.dispose();
    fnConfirmNewPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage == '') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  descriptions: 'zxczcx',
                  title: 'error',
                );
              });
        }
      },
      child: Scaffold(
        appBar: HeaderView(),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal),
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(AppTranslations()
                                  .getLanguage(context, 'newPassword')),
                              Padding(
                                padding: EdgeInsets.only(top: 44, bottom: 38),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(AppTranslations()
                                      .getLanguage(context, 'detail........')),
                                ),
                              ),
                              InputField(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                autofocus: true,
                                title: AppTranslations()
                                    .getLanguage(context, 'code'),
                                textInputAction: TextInputAction.next,
                                controller: controllerCode,
                                focusNode: fnCode,
                                onEditingComplete: () {
                                  fnCode.unfocus();
                                  fnNewPassword.requestFocus();
                                },
                              ),
                              InputField(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                title: AppTranslations()
                                    .getLanguage(context, 'newPassword'),
                                isPassword: true,
                                textInputAction: TextInputAction.next,
                                controller: controllerNewPassword,
                                icon: Icons.remove_red_eye,
                                focusNode: fnNewPassword,
                                onEditingComplete: () {
                                  fnNewPassword.unfocus();
                                  fnConfirmNewPassword.requestFocus();
                                },
                              ),
                              InputField(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                title: AppTranslations()
                                    .getLanguage(context, 'confirmNewPassword'),
                                isPassword: true,
                                textInputAction: TextInputAction.done,
                                controller: controllerConfirmPassword,
                                icon: Icons.remove_red_eye,
                                focusNode: fnConfirmNewPassword,
                                onEditingComplete: () {
                                  fnConfirmNewPassword.unfocus();
                                },
                              ),
                            ],
                          ),
                        ),
                        flex: 1),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child:
                          BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                        return ElevatedButtonCustom(
                          onPressed: () {},
                          title: AppTranslations()
                              .getLanguage(context, 'saveNewPassword'),
                        );
                      }),
                    ),
                    BottomSpace(),
                  ],
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state.requesting) return OverlayLoading();
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
