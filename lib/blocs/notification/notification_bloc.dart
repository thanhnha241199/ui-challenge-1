import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookkeepa/models/notification/notification.dart';
import 'package:bookkeepa/respositories/notification/index.dart';
import 'package:bookkeepa/util/parseError.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepositories notificationRepositories;
  NotificationBloc() : super(NotificationInitial());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is FetchNotification) {
      try {
        yield LoadingState();
        var result = notificationRepositories.getNotification();
        print("result ${result}");
      } catch (e) {
        ParseError error = ParseError.fromJson(e);
        print(error);
        yield FailedState();
      }
    }
  }
}
