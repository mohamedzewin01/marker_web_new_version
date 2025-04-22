import 'package:json_annotation/json_annotation.dart';

part 'device_response.g.dart';

@JsonSerializable()
class DeviceResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "device")
  final Device? device;

  DeviceResponse ({
    this.status,
    this.message,
    this.device,
  });

  factory DeviceResponse.fromJson(Map<String, dynamic> json) {
    return _$DeviceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeviceResponseToJson(this);
  }
}

@JsonSerializable()
class Device {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "device_id")
  final String? deviceId;
  @JsonKey(name: "device_name")
  final String? deviceName;
  @JsonKey(name: "is_blocked")
  final String? isBlocked;
  @JsonKey(name: "created_at")
  final String? createdAt;

  Device ({
    this.id,
    this.deviceId,
    this.deviceName,
    this.isBlocked,
    this.createdAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return _$DeviceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeviceToJson(this);
  }
}


