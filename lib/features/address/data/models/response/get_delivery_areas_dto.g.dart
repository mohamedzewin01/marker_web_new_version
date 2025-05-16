// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_delivery_areas_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeliveryAreasDto _$GetDeliveryAreasDtoFromJson(Map<String, dynamic> json) =>
    GetDeliveryAreasDto(
      status: json['status'] as bool?,
      dataAreas:
          (json['data'] as List<dynamic>?)
              ?.map((e) => DataAreas.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetDeliveryAreasDtoToJson(
  GetDeliveryAreasDto instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.dataAreas};

DataAreas _$DataAreasFromJson(Map<String, dynamic> json) => DataAreas(
  id: (json['id'] as num?)?.toInt(),
  areaName: json['area_name'] as String?,
  deliveryCost: json['delivery_cost'] as String?,
  deliveryTime: json['delivery_time'] as String?,
  minimumOrderValue: json['minimum_order_value'] as String?,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  additionalFees: json['additional_fees'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  paymentMethods: json['payment_methods'] as String?,
);

Map<String, dynamic> _$DataAreasToJson(DataAreas instance) => <String, dynamic>{
  'id': instance.id,
  'area_name': instance.areaName,
  'delivery_cost': instance.deliveryCost,
  'delivery_time': instance.deliveryTime,
  'minimum_order_value': instance.minimumOrderValue,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'additional_fees': instance.additionalFees,
  'is_active': instance.isActive,
  'notes': instance.notes,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'payment_methods': instance.paymentMethods,
};
