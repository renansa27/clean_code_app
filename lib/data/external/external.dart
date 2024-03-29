import 'package:dio/dio.dart';
import 'package:tut_project/data/responses/responses.dart';

class ExternalUserAccess {
  //localhost
  static const String baseUrl = 'http://192.168.0.118:8080/api/users';
  final Dio httpConnection = Dio();

  Future<UserResponse> createUser({required UserResponse user}) async {
    Response response =
        await httpConnection.post(baseUrl, queryParameters: user.toJson());
    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> login(
      {required String email, required String password}) async {
    Response response = await httpConnection.post('$baseUrl/login',
        queryParameters: {"email": email, "password": password});
    return UserResponse.fromJson(response.data);
  }

  //Ainda não está implementado no back-end
  /* Future<User> getUserByEmail(
      {required String email, required String password}) async {
    Response response = await httpConnection.get('$baseUrl/login',
        queryParameters: {"email": email, "password": password});
    return User.fromJson(response.data);
  } */

  Future<UserResponse> getUsers() async {
    Response response = await httpConnection.get(baseUrl);
    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> deleteUser(
      {required String email, required String userId}) async {
    Response response =
        await httpConnection.delete(baseUrl, queryParameters: {"id": userId});
    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> updateUser({required UserResponse user}) async {
    Response response =
        await httpConnection.put(baseUrl, queryParameters: user.toJson());
    return UserResponse.fromJson(response.data);
  }
}
