import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tut_project/app/constant.dart';
import 'package:tut_project/data/responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/users/login")
  Future<UserResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("users/signUp")
  Future<UserResponse> signUp();

  @GET("/users")
  Future<UserResponse> getAllUsers();

  @PUT("/users")
  Future<UserResponse> updateUser();

  @DELETE("/users")
  Future<void> deleteUser();
}
