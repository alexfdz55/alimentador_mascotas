import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TimeCard extends StatelessWidget {
  final String hour;

  TimeCard({required this.hour});

  late Responsive responsive;
  late double r;
  late Widget text;
  // String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    r = responsive.wp(30);

    return GetBuilder<ConfiguracionController>(
        init: ConfiguracionController(),
        id: 'time',
        builder: (_) {
          final hora = hour;

          text = Text(
            hora,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.wp(3.5),
              fontWeight: FontWeight.bold,
            ),
          );
          return _button(context, _);
        });
  }

  _button(BuildContext context, ConfiguracionController _) {
    return Container(
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
                color: kPrimaryColor,
                size: r,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: r / 2,
                height: r / 2,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                //color: Colors.red,
                width: responsive.wp(15),
                height: 60,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: text,
                ),
              ),
            )
          ],
        ));
  }
}
