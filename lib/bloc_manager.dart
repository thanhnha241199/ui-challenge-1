import 'package:bookkeepa/app.dart';
import 'package:bookkeepa/blocs/auth/auth_bloc.dart';
import 'package:bookkeepa/blocs/notification/notification_bloc.dart';
import 'package:bookkeepa/blocs/userprofile/userprofile_bloc.dart';
import 'package:bookkeepa/blocs/business/business_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider<UserprofileBloc>(
          create: (context) => UserprofileBloc(),
        ),
        BlocProvider<BusinessBloc>(
          create: (context) => BusinessBloc(),
        ),
      ],
      child: App(),
    );
  }
}
