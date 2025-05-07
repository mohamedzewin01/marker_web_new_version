import 'package:json_annotation/json_annotation.dart';

part 'auth_signup_request.g.dart';

@JsonSerializable()
class AuthSignupRequest {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  AuthSignupRequest ({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.rePassword,
    this.gender
  });

  factory AuthSignupRequest.fromJson(Map<String, dynamic> json) {
    return _$AuthSignupRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthSignupRequestToJson(this);
  }
}


