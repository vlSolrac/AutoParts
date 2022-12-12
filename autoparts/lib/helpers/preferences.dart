import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _idUser = "";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set idUser(String value) {
    _idUser = value;
    _prefs.setString("idUser", value);
  }

  static String get idUser {
    return _prefs.getString("idUser") ?? _idUser;
  }

  static deletePreferences() async {
    await _prefs.remove("idUser");
  }
}
