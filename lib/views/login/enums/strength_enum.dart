class StrengthEnum {
  static const String weak = 'weak';
  static const String soso = 'soso';
  static const String good = 'good';
  static const String great = 'great';

  String valueOf(String strength) {
    switch (strength) {
      case 'weak':
        return StrengthEnum.weak;
      case 'soso':
        return StrengthEnum.soso;
      case 'good':
        return StrengthEnum.good;
      case 'great':
        return StrengthEnum.great;
      default:
        throw ArgumentError(strength);
    }
  }
}
