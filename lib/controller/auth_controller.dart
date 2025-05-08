import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final SharedPreferences _pref;
  AuthController(this._pref);

  bool get isLoggedIn => _pref.containsKey('id');

  logIn(String id) => _pref.setString('id', id);
  logOut() => _pref.clear();
}
