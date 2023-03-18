import 'dart:async';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/domain/usecase/login_usecase.dart';
import 'package:tut_project/views/base/base_view_model.dart';
import 'package:tut_project/views/common/freezed_data_classes.dart';

// Voltar para aula 77
class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userStreamController =
      StreamController<User>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("renansa27@gmail.com", "TesteSenha321");

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  //inputs
  @override
  void dispose() {
    _userStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputUser => _userStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        loginObject.email,
        loginObject.password,
      ),
    ))
        .fold(
      (failure) => {
        //Left -> Failure
        print(failure.message),
      },
      (data) => {
        //Right -> Success
        setUser(data),
        //print(data.nome),
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    // data class operation same as kotlin
    loginObject = loginObject.copyWith(
      password: password,
    );
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    // data class operation same as kotlin
    loginObject = loginObject.copyWith(
      email: email,
    );
  }

  @override
  setUser(User user) {
    inputUser.add(user);
    /* loginObject = loginObject.copyWith(
      user: user,
    ); */
  }

  //outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<User> get user => _userStreamController.stream.map((user) => user);

  //private functions
}

_isPasswordValid(String password) {
  return password.isNotEmpty;
}

_isEmailValid(String email) {
  return email.isNotEmpty;
}

abstract class LoginViewModelInputs {
  // four functions
  setUser(User user);
  setEmail(String email);
  setPassword(String password);
  login();
  // three sinks
  Sink get inputUser;
  Sink get inputEmail;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<User> get user;
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
}
