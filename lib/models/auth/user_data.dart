import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String registerId;
  final String message;
  final bool isActive;
  final bool registerd;
  final bool isVerifiedPhone;
  final bool newUser;
  final String language;

  UserData({
    this.message,
    this.registerId,
    this.isActive,
    this.registerd,
    this.isVerifiedPhone,
    this.newUser,
    this.language = 'en',
  });

  @override
  List<Object> get props => [
        this.message,
        this.registerId,
        this.isActive,
        this.registerd,
        this.isVerifiedPhone,
        this.newUser,
        this.language,
      ];

  static UserData fromJson(dynamic json) {
    return UserData(
        registerId: json['register_id'],
        message: json['message'],
        isActive: json['is_active'],
        isVerifiedPhone: json['is_verified_phone'],
        newUser: json['new_user'],
        registerd: json['registerd']);
  }
}
