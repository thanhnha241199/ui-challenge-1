part of 'userprofile_bloc.dart';

abstract class UserprofileEvent extends Equatable {
  const UserprofileEvent();

  @override
  List<Object> get props => [];
}

class FetchUserProfile extends UserprofileEvent {}

class EditUserProfile extends UserprofileEvent {
  final String firstname;
  final String lastname;
  EditUserProfile({this.firstname, this.lastname});
}
