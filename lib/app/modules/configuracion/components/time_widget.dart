import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TimetWidget extends StatelessWidget {
  String hour;

  TimetWidget({required this.hour});
  // String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GetBuilder<ConfiguracionController>(
      init: ConfiguracionController(),
      id: 'time_start',
      builder: (_) => InkWell(
        child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(left: 5),
            width: responsive.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(Icons.watch_later_rounded, color: Colors.white),
                SizedBox(width: 20),
                hour.length == 0
                    ? Container()
                    : Text(
                        hour,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                SizedBox(width: 60),
              ],
            )),
        onTap: () => _show(context, _),
      ),
    );
  }

  Future<void> _show(BuildContext context, ConfiguracionController _) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      helpText: 'Seleccionar hora inicial',
      initialTime: TimeOfDay.fromDateTime(_.initHour),
    );
    if (result != null) {
      hour = result.format(context);
      // _.prefs.horas.add(hour);
      _.horasTime.add(hour);

      _.prefs.horas = _.horasTime;

      // _.prefs.setListData('horas', ['1', '2']);
      // if (result.hour == 12) {
      //   _.hour = result.format(context) + ':PM';
      // } else if (result.hour > 12) {
      //   _.hour = result.format(context);
      // } else {
      //   _.hour = result.format(context) + ':AM';
      // }
      _.update(['time_start']);
    }
  }
}
