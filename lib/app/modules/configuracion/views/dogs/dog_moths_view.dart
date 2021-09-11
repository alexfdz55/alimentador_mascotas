import 'package:alimentador_mascote/app/models/dog_models.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/infos_text/infos_text.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class DogMothsView extends GetView<ConfiguracionController> {
  @override
  Widget build(BuildContext context) {
    final icon2 = Icons.watch_later;
    final dog = Dog();
    final meses = Dog().infoMeses;

    List<String> mesesList = [];
    List<String> infos = [];
    for (var k in infoMeses.keys) {
      mesesList.add(k);
      infos.add(infoMeses[k]!);
      //print(infoMeses[k]!);
    }
    return CustomPage(
      isBack: true,
      title: 'Qual a idade dele?',
      child: ListView.builder(
        itemBuilder: (__, index) {
          // print(portes[index[]]);
          return BotonGordo(
              sizeIcon: 20,
              icon: FontAwesomeIcons.dog,
              icon2: icon2,
              sizeIcon2: 100,
              color1: kPrimaryColor,
              texto: mesesList[index],
              onPress: () {
                Get.to(EntrarDatosView(infos[index]));
              });
        },
        itemCount: mesesList.length,
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 60),
      //       BotonGordo(
      //           sizeIcon: 20,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: '2 a 3 meses',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //       BotonGordo(
      //           sizeIcon: 30,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: '4 a 5 meses',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //       BotonGordo(
      //           sizeIcon: 40,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: '6 a 7 meses',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //       BotonGordo(
      //           sizeIcon: 40,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: '8 meses',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //     ],
      //   ),
      // ),
    );
  }
}
