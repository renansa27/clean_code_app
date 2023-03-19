import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/domain/usecase/login_usecase.dart';
import 'package:tut_project/views/common/log.dart';
//import 'package:tut_project/views/common/freezed_data_classes.dart';
import 'package:tut_project/views/login/cubit/auth_state.dart';

// 1
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _authService;

  AuthCubit(this._authService) : super(AuthState.init());

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.rebuild((b) => b..email));
    try {
      (await _authService.loginWithEmail(
        LoginUseCaseInput(
          email,
          password,
        ),
      ))
          .fold(
        (failure) => {
          //Left -> Failure
          log.d(failure.message),
          emit(state.rebuild(
            (b) => b..error = failure.message,
          )),
        },
        (user) => {
          //Right -> Success
          emit(state.rebuild((b) => b..user = user)),
          //print(data.nome),
        },
      );
      //getUser();
    } on Exception catch (e) {
      emit(state.rebuild((b) => b..error = e.toString()));
    }
  }
}

//////////

/* class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _authService;
  AuthCubit(this._authService) : super(LoginIdle());

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      (await _authService.loginWithEmail(
        LoginUseCaseInput(
          email,
          password,
        ),
      ))
          .fold(
        (failure) => {
          //Left -> Failure
          emit(LoginError(
            //email: email,
            //password: password,
            message: failure.message,
          )),
          log.d(failure.message),
        },
        (data) => {
          //Right -> Success
          emit(LoginSuccess(user: data)),
          //print(data.nome),
        },
      );
      //getUser();
    } on Exception catch (e) {
      emitError(message: e.toString());
    }
  }

  /* Future<void> signUpWithEmail({
    @required String? email,
    @required String? password,
  }) async {
    emit(LoginLoading());
    try {
      await _authService.signUpWithEmail(
        email: email,
        password: password,
      );
      getUser();
    } on Exception catch (e) {
      emitError(message: e.toString());
    }
  }

  Future<void> sendEmailVerification() async {
    await _authService.sendEmailVarification();
    logger.d('Enviou email de verificação');
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    try {
      await _authService.loginWithFacebook();
      getUser();
    } catch (e) {
      emitError(message: e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      await _authService.loginWithGoogleMobile();
      getUser();
    } catch (e) {
      emitError(message: e.toString());
    }
  }

  Future<void> resetPassword({@required String? email}) async {
    emit(LoginLoading());
    try {
      await _authService.resetPassword(email: email);
      emit(ResetPassword());
    } catch (e) {
      log('unhandeled error -  $e');
    }
  }

  Future<bool> passwordReset({
    String? oobCode,
    String? newPassword,
  }) async {
    emit(LoginLoading());
    try {
      await _authService.confirmPasswordReset(
        oobCode: oobCode,
        newPassword: newPassword,
      );
      emit(Logout());
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<void> verifyEmail(String? oobCode) async {
    emit(LoginLoading());
    if (oobCode != null) {
      bool isEmailChecked = await checkEmail(oobCode);
      if (isEmailChecked) {
        await _authService.reloadUser();
        if (_authService.isEmailVerified()) {
          emit(LoginSuccess(user: _authService.getUser()));
          logger.d('Verificou');
        } else {
          emit(LoginEmailNotVerified());
          logger.d('Não verificou');
        }
      }
    }
  }

  Future<bool> checkEmail(String oobCode) async {
    return await _authService.checkEmailCallback(oobCode);
  }

  Future<User?> getUser() async {
    emit(LoginLoading());
    final User? user = _authService.getUser();
    if (user != null &&
        (_authService.isEmailVerified() || _authService.isSocialLogin())) {
      emit(LoginSuccess(user: user));
      return user;
    } else if (user != null) {
      emit(LoginEmailNotVerified());
      return user;
    } else {
      emit(Logout());
    }
    return null;
  }

  Future<void> logout() async {
    emit(LoginLoading());
    try {
      await _authService.logout();
    } catch (e) {
      emitError(message: "Erro ao tentar fazer logout!");
    }
    emit(Logout());
  }

  Future<void> deleteUser() async {
    await _authService.deleteUser();
    emit(Logout());
  } */

  void emitLoginSucess(User user) {
    emit(LoginSuccess(user: user));
  }

  void emitError({@required String? message}) {
    emit(state);
  }
} */
