import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance = LocalStorageService();
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  SharedPreferences? getPreferences() {
    return _preferences;
  }
}
