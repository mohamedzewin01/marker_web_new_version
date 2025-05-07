import 'package:json_annotation/json_annotation.dart';

part 'auth_signin_request.g.dart';

@JsonSerializable()
class AuthSignInRequest {
  @JsonKey(name: "login")
  final String? login;
  @JsonKey(name: "password")
  final String? password;

  AuthSignInRequest ({
    this.login,
    this.password,
  });

  factory AuthSignInRequest.fromJson(Map<String, dynamic> json) {
    return _$AuthSignInRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthSignInRequestToJson(this);
  }
}


