enum LanguageType { ENGLISH, PORTUGUESE }

const String ENGLISH = "en";
const String PORTUGUESE = "pt-br";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.PORTUGUESE:
        return PORTUGUESE;
    }
  }
}
