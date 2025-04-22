// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceResponse _$DeviceResponseFromJson(Map<String, dynamic> json) =>
    DeviceResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      device:
          json['device'] == null
              ? null
              : Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceResponseToJson(DeviceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'device': instance.device,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
  id: (json['id'] as num?)?.toInt(),
  deviceId: json['device_id'] as String?,
  deviceName: json['device_name'] as String?,
  isBlocked: json['is_blocked'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'id': instance.id,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'is_blocked': instance.isBlocked,
  'created_at': instance.createdAt,
};
