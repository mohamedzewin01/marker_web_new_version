// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileUserInfoDto _$GetProfileUserInfoDtoFromJson(
  Map<String, dynamic> json,
) => GetProfileUserInfoDto(
  status: json['status'] as String?,
  user:
      json['user'] == null
          ? null
          : ProfileUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetProfileUserInfoDtoToJson(
  GetProfileUserInfoDto instance,
) => <String, dynamic>{'status': instance.status, 'user': instance.user};

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  profileImage: json['profile_image'] as String?,
  role: json['role'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  lastLogin: json['last_login'] as String?,
  verifiedAt: json['verified_at'] as String?,
);

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'profile_image': instance.profileImage,
      'role': instance.role,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'last_login': instance.lastLogin,
      'verified_at': instance.verifiedAt,
    };
