import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController comidasTextController = TextEditingController();
  int cantidadComidas = 0;

  String timeStart = '';
  DateTime initHour = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0);

  List<Widget> horasComidas = [];
}
