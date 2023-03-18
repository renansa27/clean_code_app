import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_project/views/resources/language_manager.dart';

const String PREFES_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFES_KEY_LANG);
    return language ?? LanguageType.ENGLISH.getValue();
  }
}
