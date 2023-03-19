abstract class RegExpPatterns {
  static const String email = r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$';
  static const String name = r'^[\w-]{2-20}$';
  static const String workspaceCharacters = r'[\w\-.]$';
  static const String workspaceFirstCharacter = r'^[a-zA-Z]{1}$';
  static const String workspace = r'^[a-zA-Z]{1}[\w\-.]{3,14}$';
  static const String username = r'^[a-zA-Z]{1}[\w\-.]{3,14}$';
  static const String password =
      r'''^[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~@.]{6,32}$''';
  static const String lowerCamelCaseWithSnakeNotation =
      r'[a-z0-9]{1}[a-z0-9_]*';
  static const digitVerify = r'\d';
  static const specialCharacterVerify = r'''[!#$%&'*+-/=?^_`{|}~@.]''';
  static const lowCaseVerify = r'(?=.*[a-z])';
  static const upperCaseVerify = r'(?=.*[A-Z])';
}
