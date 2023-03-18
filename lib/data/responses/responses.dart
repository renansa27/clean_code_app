import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'statusMessage')
  String? statusMessage;
}

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'nome')
  String? nome;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'age')
  int? age;

  UserResponse({
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
    required this.age,
  });

// from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

// to JSON
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
