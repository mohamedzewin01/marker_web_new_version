import 'package:json_annotation/json_annotation.dart';

part 'edit_address_request.g.dart';

@JsonSerializable()
class EditAddressRequest {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "delivery_area_id")
  final int? deliveryAreaId;
  @JsonKey(name: "isActive")
  final int? isActive;

  EditAddressRequest ({
    this.id,
    this.userId,
    this.title,
    this.street,
    this.city,
    this.lat,
    this.long,
    this.details,
    this.deliveryAreaId,
    this.isActive,
  });

  factory EditAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$EditAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditAddressRequestToJson(this);
  }
}


