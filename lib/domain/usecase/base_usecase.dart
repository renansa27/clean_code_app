import 'package:dartz/dartz.dart';
import 'package:tut_project/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> loginWithEmail(In input);
}
