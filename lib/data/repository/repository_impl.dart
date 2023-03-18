import 'package:dio/dio.dart';
import 'package:tut_project/data/data_source/remote_data_source.dart';
import 'package:tut_project/data/network/error_handler.dart';
import 'package:tut_project/data/network/network_info.dart';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/data/request/request.dart';
import 'package:tut_project/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tut_project/domain/repository/repository.dart';
import 'package:tut_project/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // it's safe to call the API
        final response = await _remoteDataSource.login(loginRequest);
        // success
        if (response.statusCode == ApiInternalStatus.SUCCESS) {
          // return data (success)
          // return right (User)
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left (error)
          return Left(
            Failure(response.statusCode ?? ApiInternalStatus.FAILURE,
                response.statusMessage ?? ReponseMessage.DEFAULT),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
