import 'package:json_annotation/json_annotation.dart';

part 'add_address.g.dart';

@JsonSerializable()
class AddAddressRequest {
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

  AddAddressRequest ({
    this.userId,
    this.title,
    this.street,
    this.city,
    this.lat,
    this.long,
    this.details,
    this.deliveryAreaId,
  });

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$AddAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddAddressRequestToJson(this);
  }
}


