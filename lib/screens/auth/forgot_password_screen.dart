import 'package:bookkeepa/blocs/auth/index.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/bottom_space.dart';
import 'package:bookkeepa/widgets/elevated_button_custom.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/input_field.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controllerPhone;
  @override
  void initState() {
    super.initState();
    controllerPhone = TextEditingController(text: '+64411689759');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(AppTranslations()
                                .getLanguage(context, 'resetyourPassword')),
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
                                  .getLanguage(context, 'phoneNumber'),
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              controller: controllerPhone,
                              icon: Icons.check_circle,
                            ),
                          ],
                        ),
                      ),
                      flex: 1),
                  ElevatedButtonCustom(
                    onPressed: () {},
                    title:
                        AppTranslations().getLanguage(context, 'resetPassword'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        AppTranslations().getLanguage(context, 'cancel'),
                      )),
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
    );
  }
}
