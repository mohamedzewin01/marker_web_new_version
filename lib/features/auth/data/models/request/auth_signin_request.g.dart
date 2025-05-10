// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignInRequest _$AuthSignInRequestFromJson(Map<String, dynamic> json) =>
    AuthSignInRequest(
      login: json['login'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthSignInRequestToJson(AuthSignInRequest instance) =>
    <String, dynamic>{'login': instance.login, 'password': instance.password};
