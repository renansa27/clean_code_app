//import 'package:tut_project/app/functions.dart';
import 'package:tut_project/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tut_project/data/request/request.dart';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/domain/repository/repository.dart';
import 'package:tut_project/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, User> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(LoginUseCaseInput input) async {
    //To get the device name, identifier and OS version use this.
    //DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
