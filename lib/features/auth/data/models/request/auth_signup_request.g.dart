// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignupRequest _$AuthSignupRequestFromJson(Map<String, dynamic> json) =>
    AuthSignupRequest(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$AuthSignupRequestToJson(AuthSignupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'password': instance.password,
      'rePassword': instance.rePassword,
    };
