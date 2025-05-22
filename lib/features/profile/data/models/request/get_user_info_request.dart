import 'package:json_annotation/json_annotation.dart';

part 'get_user_info_request.g.dart';

@JsonSerializable()
class GetUserInfoRequest {
  @JsonKey(name: "id")
  final int? id;

  GetUserInfoRequest ({
    this.id,
  });

  factory GetUserInfoRequest.fromJson(Map<String, dynamic> json) {
    return _$GetUserInfoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserInfoRequestToJson(this);
  }
}


