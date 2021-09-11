import 'package:alimentador_mascote/app/modules/configuracion/components/time_widget.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/shared/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoraComida extends StatelessWidget {
  final int index;
  HoraComida({Key? key, required this.index}) : super(key: key);
  final _ = Get.put(ConfiguracionController());
  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
      child: Column(
        children: [
          TextTitle(
              title: 'Hora da refeição $index',
              color: Colors.white,
              fontSize: 20),
          SizedBox(height: 10),
          TimetWidget(
            // hour:
            hour: _.horas[index - 1],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
