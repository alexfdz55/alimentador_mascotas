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

  bool get isDog {
    return _prefs.getBool('isDog') ?? true;
  }

  set isDog(bool value) {
    _prefs.setBool('isDog', value);
  }

  bool get isCat {
    return _prefs.getBool('isCat') ?? true;
  }

  set isCat(bool value) {
    _prefs.setBool('isCat', value);
  }

  bool get isOther {
    return _prefs.getBool('isOther') ?? true;
  }

  set isOther(bool value) {
    _prefs.setBool('isOther', value);
  }

  double get pesoComida {
    return _prefs.getDouble('pesoComida') ?? 0.0;
  }

  set pesoComida(double value) {
    _prefs.setDouble('pesoComida', value);
  }

  int get cantidadComidas {
    return _prefs.getInt('cantidadComidas') ?? 0;
  }

  set cantidadComidas(int value) {
    _prefs.setInt('cantidadComidas', value);
  }

  double get pesoComidaDiario {
    return _prefs.getDouble('pesoComidaDiario') ?? 0.0;
  }

  set pesoComidaDiario(double value) {
    _prefs.setDouble('pesoComidaDiario', value);
  }

  List<String> get horas {
    return _prefs.getStringList('horas') ?? [];
  }

  set horas(List<String> value) {
    _prefs.setStringList('horas', value);
  }

  // setListData(String key, List<String> value) async {
  //   _prefs.setStringList(key, value);
  // }

  // Future<List<String>> getListData(String key) async {
  //   return _prefs.getStringList(key)!;
  // }
}
