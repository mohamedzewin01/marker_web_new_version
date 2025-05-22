import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;

  EditProfileRequest ({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$EditProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileRequestToJson(this);
  }
}


