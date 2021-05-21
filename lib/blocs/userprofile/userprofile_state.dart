part of 'userprofile_bloc.dart';

class UserProfileState extends Equatable {
  final bool notificationRequesting;
  final String notificationErrorCode;
  final String notificationErrorMessage;
  final bool notificationSuccess;

  final UserProfileModel userProfileData;

  UserProfileState(
      {this.userProfileData,
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

  factory UserProfileState.empty() {
    return UserProfileState(
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
    UserProfileModel userProfileData,
  }) {
    return (UserProfileState(
      notificationRequesting: notificationRequesting ?? false,
      notificationErrorCode: notificationErrorCode ?? '',
      notificationErrorMessage: notificationErrorMessage ?? '',
      notificationSuccess: notificationSuccess ?? false,
      userProfileData: userProfileData ?? this.userProfileData,
    ));
  }
}
