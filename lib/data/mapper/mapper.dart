// To convert the response into non nullable object (model)
import 'package:tut_project/app/extension.dart';
import 'package:tut_project/data/responses/responses.dart';
import 'package:tut_project/domain/model/model.dart';

// ignore: constant_identifier_names
const EMPTY = "";
// ignore: constant_identifier_names
const ZERO = 0;

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.id.orZero() ?? ZERO,
      this?.nome.orEmpty() ?? EMPTY,
      this?.email.orEmpty() ?? EMPTY,
      this?.password.orEmpty() ?? EMPTY,
      this?.age.orZero() ?? ZERO,
    );
  }
}
