import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConfiguracionController extends GetxController {
  TextEditingController comidasTextController = TextEditingController();
  TextEditingController pesoTextController = TextEditingController();
  int cantidadComidas = 0;

  int pesoComida = 0;

  String timeStart = '';
  DateTime initHour = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0);

  List<Widget> horasComidas = [];
}
