import 'package:json_annotation/json_annotation.dart';

part 'get_cart_request.g.dart';

@JsonSerializable()
class GetCartRequest {
  @JsonKey(name: "user_id")
  final int? userId;

  GetCartRequest ({
    this.userId,
  });

  factory GetCartRequest.fromJson(Map<String, dynamic> json) {
    return _$GetCartRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartRequestToJson(this);
  }
}


