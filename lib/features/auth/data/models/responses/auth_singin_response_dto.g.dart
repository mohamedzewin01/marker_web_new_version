// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_singin_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSingInResponseDto _$AuthSingInResponseDtoFromJson(
  Map<String, dynamic> json,
) => AuthSingInResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : UserSignin.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthSingInResponseDtoToJson(
  AuthSingInResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'user': instance.user,
};

UserSignin _$UserSigninFromJson(Map<String, dynamic> json) => UserSignin(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  photo: json['photo'] as String?,
  phone: json['phone'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserSigninToJson(UserSignin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender,
      'photo': instance.photo,
      'phone': instance.phone,
      'created_at': instance.createdAt,
    };
