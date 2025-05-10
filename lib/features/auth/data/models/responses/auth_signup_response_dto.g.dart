// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signup_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignupResponseDto _$AuthSignupResponseDtoFromJson(
  Map<String, dynamic> json,
) => AuthSignupResponseDto(
  status: json['status'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthSignupResponseDtoToJson(
  AuthSignupResponseDto instance,
) => <String, dynamic>{'status': instance.status, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'is_active': instance.isActive,
  'gender': instance.gender,
  'created_at': instance.createdAt,
};
