// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAddressRequest _$EditAddressRequestFromJson(Map<String, dynamic> json) =>
    EditAddressRequest(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      details: json['details'] as String?,
      deliveryAreaId: (json['delivery_area_id'] as num?)?.toInt(),
      isActive: (json['isActive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EditAddressRequestToJson(EditAddressRequest instance) =>
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
      'isActive': instance.isActive,
    };
