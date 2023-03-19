import 'package:tut_project/utils/regex.dart';

bool validateEmail(String? value) {
  if (value == null || value.isEmpty) return false;
  final regExp = RegExp(RegExpPatterns.email);
  return regExp.hasMatch(value);
}

bool validatePassword(String? value) {
  if (value == null || value.isEmpty) return false;
  final regExp = RegExp(RegExpPatterns.password);
  return regExp.hasMatch(value);
}

bool validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null ||
      confirmPassword.isEmpty ||
      password != confirmPassword) return false;
  final regExp = RegExp(RegExpPatterns.password);
  return regExp.hasMatch(confirmPassword);
}

int getStreghtPassword(String password) {
  var res = 0;
  final regDigExp = RegExp(RegExpPatterns.digitVerify);
  final regSpecialCharExp = RegExp(RegExpPatterns.specialCharacterVerify);
  final regLowerCaseExp = RegExp(RegExpPatterns.lowCaseVerify);
  final regUpperCaseExp = RegExp(RegExpPatterns.upperCaseVerify);
  if (regUpperCaseExp.hasMatch(password)) {
    res++;
  }
  if (regLowerCaseExp.hasMatch(password)) {
    res++;
  }
  if (regSpecialCharExp.hasMatch(password)) {
    res++;
  }
  if (regDigExp.hasMatch(password)) {
    res++;
  }
  return res;
}
