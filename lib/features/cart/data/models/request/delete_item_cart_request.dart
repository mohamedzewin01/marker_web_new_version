import 'package:json_annotation/json_annotation.dart';

part 'delete_item_cart_request.g.dart';

@JsonSerializable()
class DeleteItemCartRequest {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "product_id")
  final int? productId;

  DeleteItemCartRequest ({
    this.userId,
    this.productId,
  });

  factory DeleteItemCartRequest.fromJson(Map<String, dynamic> json) {
    return _$DeleteItemCartRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteItemCartRequestToJson(this);
  }
}


