part of 'business_bloc.dart';

class BusinessState extends Equatable {
  final bool businessRequesting;
  final String businessErrorCode;
  final String businessErrorMessage;
  final bool businessSuccess;
  final List<BusinessModel> businessData;

  BusinessState(
      {this.businessData,
      this.businessRequesting,
      this.businessErrorCode,
      this.businessErrorMessage,
      this.businessSuccess});

  @override
  List<Object> get props => [
        this.businessRequesting,
        this.businessErrorCode,
        this.businessErrorMessage,
        this.businessSuccess
      ];

  factory BusinessState.empty() {
    return BusinessState(
      businessRequesting: false,
      businessErrorCode: '',
      businessErrorMessage: '',
      businessSuccess: false,
    );
  }

  copyWith({
    bool businessRequesting,
    String businessErrorCode,
    String businessErrorMessage,
    bool businessSuccess,
    List<BusinessModel> businessData,
  }) {
    return (BusinessState(
      businessRequesting: businessRequesting ?? false,
      businessErrorCode: businessErrorCode ?? '',
      businessErrorMessage: businessErrorMessage ?? '',
      businessSuccess: businessSuccess ?? false,
      businessData: businessData ?? this.businessData,
    ));
  }
}
