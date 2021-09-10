import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool get isFirstInitApp {
    return _prefs.getBool('isFirstInitApp') ?? true;
  }

  set isFirstInitApp(bool value) {
    _prefs.setBool('isFirstInitApp', value);
  }

  // String get lastName {
  //   return _prefs.getString('lastName') ?? '';
  // }

  // set lastName(String value) {
  //   _prefs.setString('lastName', value);
  // }

  // String get email {
  //   return _prefs.getString('email') ?? '';
  // }

  // set email(String value) {
  //   _prefs.setString('email', value);
  // }

  // String get uid {
  //   return _prefs.getString('uid') ?? '';
  // }

  // set uid(String value) {
  //   _prefs.setString('uid', value);
  // }

  // String get urlAvatar {
  //   return _prefs.getString('urlAvatar') ?? '';
  // }

  // set urlAvatar(String value) {
  //   _prefs.setString('urlAvatar', value);
  // }

  // String get rol {
  //   return _prefs.getString('rol') ?? '';
  // }

  // set rol(String value) {
  //   _prefs.setString('rol', value);
  // }

  // String get phone {
  //   return _prefs.getString('phone') ?? '';
  // }

  // set phone(String value) {
  //   _prefs.setString('phone', value);
  // }

  // String get notification {
  //   return _prefs.getString('notification') ?? '';
  // }

  // set notification(String value) {
  //   _prefs.setString('notification', value);
  // }

  // String get firebaseToken {
  //   return _prefs.getString('firebaseToken') ?? '';
  // }

  // set firebaseToken(String value) {
  //   _prefs.setString('firebaseToken', value);
  // }

  // String get otpPin {
  //   return _prefs.getString('otpPin') ?? '';
  // }

  // set otpPin(String value) {
  //   _prefs.setString('otpPin', value);
  // }
}
