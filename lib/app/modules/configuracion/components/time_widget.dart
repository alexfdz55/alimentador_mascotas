import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TimetWidget extends StatelessWidget {
  // String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
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
                _.timeStart.length == 0
                    ? Container()
                    : Text(
                        _.timeStart,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: _.timeStart != '7:00 a.m.'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                SizedBox(width: 60),
              ],
            )),
        onTap: () => _show(context, _),
      ),
    );
  }

  Future<void> _show(BuildContext context, HomeController _) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      helpText: 'Seleccionar hora inicial',
      initialTime: TimeOfDay.fromDateTime(_.initHour),
    );
    if (result != null) {
      _.timeStart = result.format(context);
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
