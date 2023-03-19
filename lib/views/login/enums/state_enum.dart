class StateEnum {
  static const String focused = 'focused';
  static const String unfocused = 'unfocused';
  static const String filled = 'filled';
  static const String error = 'error';

  String valueOf(String state) {
    switch (state) {
      case 'focused':
        return StateEnum.focused;
      case 'unfocused':
        return StateEnum.unfocused;
      case 'filled':
        return StateEnum.filled;
      case 'error':
        return StateEnum.error;
      default:
        throw ArgumentError(state);
    }
  }
}
