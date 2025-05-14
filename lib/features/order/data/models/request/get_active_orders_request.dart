import 'package:json_annotation/json_annotation.dart';

part 'get_active_orders_request.g.dart';

@JsonSerializable()
class GetActiveOrdersRequest {
  @JsonKey(name: "user_id")
  final int? userId;

  GetActiveOrdersRequest ({
    this.userId,
  });

  factory GetActiveOrdersRequest.fromJson(Map<String, dynamic> json) {
    return _$GetActiveOrdersRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetActiveOrdersRequestToJson(this);
  }
}


