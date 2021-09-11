import 'package:alimentador_mascote/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConfiguracionController extends GetxController {
  final prefs = PreferenciasUsuario();
  late TextEditingController comidasTextController;
  late TextEditingController pesoTextController;
  int cantidadComidas = 0;
  double pesoComida = 0;

  List<String> horas = [];

  List<String> horasTime = [];

  String timeStart = '';
  DateTime initHour = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0);

  List<Widget> horasComidas = [];

  @override
  void onInit() {
    print(prefs.horas);
    cantidadComidas = prefs.cantidadComidas;
    print('cantidad de comidas ${cantidadComidas}');

    if (cantidadComidas == prefs.horas.length) {
      print('ok');
      horas = prefs.horas;
    } else {
      final items = List<String>.generate(cantidadComidas, (i) => '');
      horas = items;
      prefs.horas = horas;
    }

    pesoComida = prefs.pesoComida;

    comidasTextController =
        TextEditingController(text: cantidadComidas.toString());

    pesoTextController = TextEditingController(text: pesoComida.toString());

    print(prefs.horas.toString());
    super.onInit();
  }

  setDog() {
    prefs.isDog = true;
    prefs.isCat = false;
    prefs.isOther = false;
  }

  setCat() {
    prefs.isCat = true;
    prefs.isDog = false;

    prefs.isOther = false;
  }

  serOther() {
    prefs.isOther = true;
    prefs.isCat = false;
    prefs.isDog = false;
  }

  saveDatos() {
    if (pesoTextController.text == '' || comidasTextController.text == '') {
      pesoComida = 0.0;
      cantidadComidas = 0;
      print('Ingrese los valores');
    } else {
      pesoComida = double.parse(pesoTextController.text);

      cantidadComidas = int.parse(comidasTextController.text);
    }

    final items = List<String>.generate(cantidadComidas, (i) => '----');
    horas = items;
    prefs.horas = horas;
    print(prefs.horas);

    prefs.pesoComida = pesoComida;
    prefs.cantidadComidas = cantidadComidas;
    prefs.pesoComidaDiario = prefs.pesoComida * prefs.cantidadComidas;

    update(['horarios']);
  }
}
