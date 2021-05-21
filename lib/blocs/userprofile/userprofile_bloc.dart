import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookkeepa/models/account/user_profile.dart';
import 'package:bookkeepa/respositories/user/user_repositories.dart';
import 'package:bookkeepa/util/parseError.dart';
import 'package:equatable/equatable.dart';

part 'userprofile_event.dart';
part 'userprofile_state.dart';

class UserprofileBloc extends Bloc<UserprofileEvent, UserProfileState> {
  UserRepositories userProfileRepositories = UserRepositories();
  UserprofileBloc() : super(UserProfileState.empty());

  @override
  Stream<UserProfileState> mapEventToState(
    UserprofileEvent event,
  ) async* {
    if (event is FetchUserProfile) {
      yield* getProfileUser();
    }
    if (event is EditUserProfile) {
      yield* editProfileUser(event.firstname, event.lastname);
    }
  }

  Stream<UserProfileState> getProfileUser() async* {
    try {
      yield state.copyWith(notificationRequesting: true);
      UserProfileModel userProfileData =
          await userProfileRepositories.getUserProfile();
      print(userProfileData);
      yield state.copyWith(
          notificationSuccess: true, userProfileData: userProfileData);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
        notificationErrorCode: error.code,
        notificationErrorMessage: error.message,
      );
    }
  }

  Stream<UserProfileState> editProfileUser(
      String firstname, String lastname) async* {
    try {
      yield state.copyWith(notificationRequesting: true);
      UserProfileModel userProfileData =
          await userProfileRepositories.editUserProfile(firstname, lastname);
      yield state.copyWith(
          notificationSuccess: true, userProfileData: userProfileData);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
        notificationErrorCode: error.code,
        notificationErrorMessage: error.message,
      );
    }
  }
}
