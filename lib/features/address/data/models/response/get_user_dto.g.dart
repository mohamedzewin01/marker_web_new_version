// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserAddressesDto _$GetUserAddressesDtoFromJson(Map<String, dynamic> json) =>
    GetUserAddressesDto(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => DataAddresses.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetUserAddressesDtoToJson(
  GetUserAddressesDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

DataAddresses _$DataAddressesFromJson(Map<String, dynamic> json) =>
    DataAddresses(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      details: json['details'] as String?,
      deliveryAreaId: (json['delivery_area_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataAddressesToJson(DataAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'street': instance.street,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'details': instance.details,
      'delivery_area_id': instance.deliveryAreaId,
      'created_at': instance.createdAt,
    };
