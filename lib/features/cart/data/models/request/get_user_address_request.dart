import 'package:json_annotation/json_annotation.dart';

part 'get_user_address_request.g.dart';

@JsonSerializable()
class GetUserAddressRequest {
  @JsonKey(name: "user_id")
  final int? userId;

  GetUserAddressRequest ({
    this.userId,
  });

  factory GetUserAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$GetUserAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserAddressRequestToJson(this);
  }
}


