import 'package:flutter/cupertino.dart';

class ErrorsEnum {
  static const String tooManyRequests = 'too-many-requests';
  static const String wrongPassword = 'wrong-password';
  static const String userNotFound = 'user-not-found';
  static const String emailAlreadyUsed = 'email-already-in-use';
  static const String invalidEmail = 'invalid-email';
  static const String invalidPassword = 'invalid-password';
  static const String invalidEmailAndPassword = 'invalid-email-and-password';
  static const String passwordMustMatch = 'passwords-must-match';
  static const String passwordLenght = 'password-6-chars';
  static const String networkProblem = 'network-problem';
  static const String unkonwError = 'unknow-error';

  static String valueOf(String? state, BuildContext context) {
    switch (state) {
      case 'wrong-password':
        return 'wrong-password'; //incluir tradução aqui
      case 'user-not-found':
        return 'user-not-found';
      case 'invalid-email':
        return 'invalid-email';
      case 'invalid-password':
        return 'invalid-password';
      case 'invalid-email-and-password':
        return 'invalid-email-and-password';
      case 'passwords-must-match':
        return 'passwords-must-match';
      case 'email-already-in-use':
        return 'email-already-in-use';
      case 'password-6-chars':
        return 'password-6-chars';
      case 'network-problem':
        return 'network-problem';
      default:
        return 'unknow error';
    }
  }
}
