part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final bool notificationRequesting;
  final String notificationErrorCode;
  final String notificationErrorMessage;
  final bool notificationSuccess;

  final List<NotificationModel> notificationData;

  NotificationState(
      {this.notificationData,
      this.notificationRequesting,
      this.notificationErrorCode,
      this.notificationErrorMessage,
      this.notificationSuccess});

  @override
  List<Object> get props => [
        this.notificationRequesting,
        this.notificationErrorCode,
        this.notificationErrorMessage,
        this.notificationSuccess
      ];

  factory NotificationState.empty() {
    return NotificationState(
      notificationRequesting: false,
      notificationErrorCode: '',
      notificationErrorMessage: '',
      notificationSuccess: false,
    );
  }

  copyWith({
    bool notificationRequesting,
    String notificationErrorCode,
    String notificationErrorMessage,
    bool notificationSuccess,
    List<NotificationModel> notificationData,
  }) {
    return (NotificationState(
      notificationRequesting: notificationRequesting ?? false,
      notificationErrorCode: notificationErrorCode ?? '',
      notificationErrorMessage: notificationErrorMessage ?? '',
      notificationSuccess: notificationSuccess ?? false,
      notificationData: notificationData ?? this.notificationData,
    ));
  }
}
