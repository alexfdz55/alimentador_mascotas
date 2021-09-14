import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TimetWidget extends StatelessWidget {
  final int index;

  TimetWidget({required this.index});

  late Responsive responsive;
  late double r;
  late Widget text;
  // String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    r = responsive.wp(45);

    return GetBuilder<ConfiguracionController>(
        init: ConfiguracionController(),
        id: 'time',
        builder: (_) {
          final hora = _.prefs.horas[index];

          text = Text(
            hora,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.wp(6),
              fontWeight: FontWeight.bold,
            ),
          );
          return _button(context, _);
        });
  }

  _button(BuildContext context, ConfiguracionController _) {
    return MaterialButton(
      minWidth: r / 2,
      shape: CircleBorder(),
      padding: EdgeInsets.all(0),
      splashColor: Colors.green,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          width: r,
          height: r,
          // decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: Colors.grey.withOpacity(0.5),
          // ),
          child: Stack(
            children: [
              Positioned(
                right: r / responsive.width,
                child: Icon(
                  Icons.watch,
                  color: kSecondaryColor,
                  size: r,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: r / 2,
                  height: r / 2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: responsive.wp(25),
                  height: 80,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: text,
                  ),
                ),
              )
            ],
          )),
      onPressed: () => _show(context, _),
    );
  }

  Future<void> _show(BuildContext context, ConfiguracionController _) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      helpText: 'Seleccionar hora ',
      initialTime: TimeOfDay.fromDateTime(_.initHour),
    );
    if (result != null) {
      List<String> tempList = _.prefs.horas;
      tempList[index] = result.format(context);
      _.prefs.horas = tempList;
      _.update(['time']);
      _.homeController.update();
    }
  }
}
