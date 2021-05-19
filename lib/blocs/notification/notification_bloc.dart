import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/respositories/notification/index.dart';
import 'package:bookkeepa/util/parseError.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepositories notificationRepositories =
      NotificationRepositories();
  NotificationBloc() : super(NotificationState.empty());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is FetchNotification) {
      yield* getNotification();
    }
  }

  Stream<NotificationState> getNotification() async* {
    try {
      yield state.copyWith(notificationRequesting: true);
      List<NotificationModel> notificationData =
          await notificationRepositories.getNotification();
      yield state.copyWith(
          notificationSuccess: true, notificationData: notificationData);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
        notificationErrorCode: error.code,
        notificationErrorMessage: error.message,
      );
    }
  }
}
