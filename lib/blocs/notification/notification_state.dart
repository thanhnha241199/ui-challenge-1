part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

// ignore: must_be_immutable
class SuccessState extends NotificationEvent {
  List<NotificationModel> notification;
  SuccessState({this.notification});
}

class LoadingState extends NotificationState {}

class FailedState extends NotificationState {}
