import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tut_project/domain/model/model.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  static Serializer<AuthState> get serializer => _$authStateSerializer;

  bool? get isLoading;

  bool? get successfullyReset;

  User? get user;

  String? get email;

  String? get error;

  bool get hasSentMagicLink;

  AuthState._();

  factory AuthState([void Function(AuthStateBuilder)? updates]) = _$AuthState;

  factory AuthState.init() {
    return AuthState((b) => b..isLoading = false);
  }

  static void _initializeBuilder(AuthStateBuilder b) => b
    ..isLoading = false
    ..hasSentMagicLink = false
    ..successfullyReset = false;
}

/* abstract class AuthState {}

class LoginIdle extends AuthState {
  final String? email;
  final String? password;

  LoginIdle({this.email, this.password});
}

class LoginSuccess extends AuthState {
  final User? user;

  LoginSuccess({required this.user});
}

class ForgotPassword extends AuthState {
  final String? email;
  final String? password;

  ForgotPassword({this.email, this.password});
}

class ResetPassword extends AuthState {
  final String? email;
  final String? password;

  ResetPassword({this.email, this.password});
}

class LoginEmailNotVerified extends AuthState {
  final String? email;
  final String? password;

  LoginEmailNotVerified({this.email, this.password});
}

class LoginLoading extends AuthState {
  final String? email;
  final String? password;

  LoginLoading({this.email, this.password});
}

class LoginError extends AuthState {
  final String? message;

  LoginError({
    required this.message,
  });
}

class Logout extends AuthState {}
 */