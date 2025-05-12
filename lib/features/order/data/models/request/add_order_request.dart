import 'package:json_annotation/json_annotation.dart';

part 'add_order_request.g.dart';

@JsonSerializable()
class AddOrderRequest {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "user_address")
  final int? userAddress;

  AddOrderRequest ({
    this.userId,
    this.userAddress,
  });

  factory AddOrderRequest.fromJson(Map<String, dynamic> json) {
    return _$AddOrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderRequestToJson(this);
  }
}


