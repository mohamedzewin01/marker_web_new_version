import 'package:json_annotation/json_annotation.dart';

part 'update_cart_item.g.dart';

@JsonSerializable()
class UpdateCartItemRequest {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "quantity")
  final int? quantity;

  UpdateCartItemRequest ({
    this.userId,
    this.productId,
    this.quantity,
  });

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateCartItemRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateCartItemRequestToJson(this);
  }
}


