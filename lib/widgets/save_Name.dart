import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String infoKey = 'info';

  static Future<void> saveInfo(String info) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(infoKey, info);
  }

  static Future<String?> loadInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(infoKey);
  }
}