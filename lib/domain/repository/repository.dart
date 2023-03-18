import 'package:dartz/dartz.dart';
import 'package:tut_project/data/network/failure.dart';
import 'package:tut_project/data/request/request.dart';
import 'package:tut_project/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, User>> login(LoginRequest loginRequest);
}
