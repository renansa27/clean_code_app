// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..statusCode = json['statusCode'] as int?
  ..statusMessage = json['statusMessage'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int?,
      nome: json['nome'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      age: json['age'] as int?,
    )
      ..statusCode = json['statusCode'] as int?
      ..statusMessage = json['statusMessage'] as String?;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
    };
