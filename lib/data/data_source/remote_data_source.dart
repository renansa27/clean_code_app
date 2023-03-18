import 'package:tut_project/data/network/app_api.dart';
import 'package:tut_project/data/request/request.dart';
import 'package:tut_project/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<UserResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImp(this._appServiceClient);
  @override
  Future<UserResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
