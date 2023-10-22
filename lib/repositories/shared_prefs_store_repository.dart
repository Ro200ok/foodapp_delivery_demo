import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStoreRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
}
