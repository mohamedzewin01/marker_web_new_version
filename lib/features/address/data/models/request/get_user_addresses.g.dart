// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserAddressesRequest _$GetUserAddressesRequestFromJson(
  Map<String, dynamic> json,
) => GetUserAddressesRequest(userId: (json['user_id'] as num?)?.toInt());

Map<String, dynamic> _$GetUserAddressesRequestToJson(
  GetUserAddressesRequest instance,
) => <String, dynamic>{'user_id': instance.userId};
