import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'userprofile_event.dart';
part 'userprofile_state.dart';

class UserprofileBloc extends Bloc<UserprofileEvent, UserprofileState> {
  UserprofileBloc() : super(UserprofileInitial());

  @override
  Stream<UserprofileState> mapEventToState(
    UserprofileEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
