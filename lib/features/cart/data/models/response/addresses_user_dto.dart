import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'addresses_user_dto.g.dart';

@JsonSerializable()
class AddressesUserDto {
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<AddressesData>? data;

  AddressesUserDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddressesUserDto.fromJson(Map<String, dynamic> json) {
    return _$AddressesUserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressesUserDtoToJson(this);
  }
  GetAddressesUserEntity toAddressesUserEntity() {
    return GetAddressesUserEntity(
      status: status,
      message: message,
    addressesData: data,
    );
  }
}

@JsonSerializable()
class AddressesData {
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
  @JsonKey(name: "created_at")
  final String? createdAt;

  AddressesData ({
    this.id,
    this.userId,
    this.title,
    this.street,
    this.city,
    this.lat,
    this.long,
    this.details,
    this.deliveryAreaId,
    this.createdAt,
  });

  factory AddressesData.fromJson(Map<String, dynamic> json) {
    return _$AddressesDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressesDataToJson(this);
  }
}


