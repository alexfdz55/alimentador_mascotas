import 'package:alimentador_mascote/app/models/dog_models.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/dogs/dog_moths_view.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';

import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class DogAgeView extends GetView<ConfiguracionController> {
  final List<String> edades;
  final List<String> portes;
  final String porte;

  DogAgeView({required this.edades, required this.portes, required this.porte});
  @override
  Widget build(BuildContext context) {
    final dog = Dog();
    String info = '';

    print(porte);
    final icon2 = Icons.watch_later;
    return CustomPage(
      isBack: true,
      title: 'Qual a idade dele?',
      child: ListView.builder(
        itemBuilder: (__, index) {
          return BotonGordo(
              sizeIcon: index * 10 + 20,
              icon: FontAwesomeIcons.dog,
              icon2: icon2,
              sizeIcon2: 100,
              color1: kPrimaryColor,
              texto: edades[index],
              onPress: () {
                if (index == 0) {
                  Get.to(DogMothsView());
                } else {
                  if (porte == portes[0]) {
                    info = dog.infoPequeno[edades[index]]!;
                  } else if (porte == portes[1]) {
                    info = dog.infoMedio[edades[index]]!;
                  } else if (porte == portes[2]) {
                    info = dog.infoGrande[edades[index]]!;
                  } else if (porte == portes[3]) {
                    info = dog.infoGigante[edades[index]]!;
                  }
                  Get.to(EntrarDatosView(info));
                }
              });
        },
        itemCount: edades.length,
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 60),
      //       BotonGordo(
      //           sizeIcon: 20,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: 'Filhote, de 2 a 8 meses',
      //           onPress: () {
      //             Get.to(DogMothsView());
      //           }),
      //       BotonGordo(
      //           sizeIcon: 30,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: 'Adulto',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //       BotonGordo(
      //           sizeIcon: 40,
      //           icon: FontAwesomeIcons.dog,
      //           icon2: icon2,
      //           sizeIcon2: 100,
      //           color1: kPrimaryColor,
      //           texto: 'Idoso, cerca de ${this.edad} anos ',
      //           onPress: () {
      //             Get.to(EntrarDatosView());
      //           }),
      //     ],
      //   ),
      // ),
    );
  }
}
