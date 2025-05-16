import 'package:json_annotation/json_annotation.dart';

part 'get_user_addresses.g.dart';

@JsonSerializable()
class GetUserAddressesRequest {
  @JsonKey(name: "user_id")
  final int? userId;

  GetUserAddressesRequest ({
    this.userId,
  });

  factory GetUserAddressesRequest.fromJson(Map<String, dynamic> json) {
    return _$GetUserAddressesRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserAddressesRequestToJson(this);
  }
}


