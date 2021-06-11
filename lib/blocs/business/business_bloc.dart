import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/models/leave/leave.dart';
import 'package:bookkeepa/respositories/business/business_repositories.dart';
import 'package:bookkeepa/util/parseError.dart';
import 'package:equatable/equatable.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  BussinessRepositories bussinessRepositories = BussinessRepositories();
  BusinessBloc() : super(BusinessState.empty());

  @override
  Stream<BusinessState> mapEventToState(
    BusinessEvent event,
  ) async* {
    if (event is FetchBusiness) {
      yield* getListBusiness();
    }
    if (event is FetchListLeave) {
      yield* getListLeave();
    }
  }

  Stream<BusinessState> getListBusiness() async* {
    try {
      yield state.copyWith(businessRequesting: true);
      List<BusinessModel> businessData =
          await bussinessRepositories.getBusiness();

      yield state.copyWith(businessSuccess: true, businessData: businessData);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
        businessErrorCode: error.code,
        businessErrorMessage: error.message,
      );
    }
  }

  Stream<BusinessState> getListLeave() async* {
    try {
      yield state.copyWith(businessRequesting: true);
      List<LeaveModel> leaveData = await bussinessRepositories.getLeave();
      yield state.copyWith(businessSuccess: true, leaveData: leaveData);
    } catch (e) {
      ParseError error = ParseError.fromJson(e);
      yield state.copyWith(
        businessErrorCode: error.code,
        businessErrorMessage: error.message,
      );
    }
  }
}
