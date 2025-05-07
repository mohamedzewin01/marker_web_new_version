import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request.g.dart';

@JsonSerializable()
class AddToCartRequest {
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "user_id")
  final int? userId;

  AddToCartRequest ({
    this.productId,
    this.quantity,
    this.userId,
  });

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) {
    return _$AddToCartRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToCartRequestToJson(this);
  }
}


