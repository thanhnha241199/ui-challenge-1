import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookkeepa/models/business/business.dart';
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
      yield* getProfileUser();
    }
  }

  Stream<BusinessState> getProfileUser() async* {
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
}
