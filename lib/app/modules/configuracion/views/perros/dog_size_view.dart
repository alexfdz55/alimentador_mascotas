import 'package:alimentador_mascote/app/models/dog_models.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/perros/dog_age.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class DogSizeView extends GetView<ConfiguracionController> {
  final dog = Dog();
  final portes = Dog().porte;
  String porte = '';
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      isBack: true,
      title: 'Qual o porte do cachorro?',
      child: ListView.builder(
        itemBuilder: (__, index) {
          for (var k in portes[index].keys) {
            // k -> portes
            porte = k;
            //print(k);
          }
          // print(portes[index[]]);
          return BotonGordo(
              sizeIcon: 20,
              icon: FontAwesomeIcons.dog,
              color1: kPrimaryColor,
              texto: porte,
              onPress: () {
                List<String>? edades = [];
                for (var k in portes[index].keys) {
                  edades = portes[index][k];
                  // a -> listas de cada  porte
                  //print(edades);
                }
                Get.to(DogAgeView(edades!));
              });
        },
        itemCount: portes.length,
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return CustomPage(
  //     isBack: true,
  //     title: 'Qual o porte do cachorro?',
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(height: 60),
  //           BotonGordo(
  //               sizeIcon: 20,
  //               icon: FontAwesomeIcons.dog,
  //               color1: kPrimaryColor,
  //               texto: 'Pequeno',
  //               onPress: () {
  //                 Get.to(DogAgeView());
  //               }),
  //           BotonGordo(
  //               sizeIcon: 30,
  //               icon: FontAwesomeIcons.dog,
  //               color1: kPrimaryColor,
  //               texto: 'Médio',
  //               onPress: () {
  //                 Get.to(DogAgeView());
  //               }),
  //           BotonGordo(
  //               sizeIcon: 40,
  //               icon: FontAwesomeIcons.dog,
  //               color1: kPrimaryColor,
  //               texto: 'Grande, entre 25 e 40 quilos',
  //               onPress: () {
  //                 Get.to(DogAgeView());
  //               }),
  //           BotonGordo(
  //               sizeIcon: 60,
  //               icon: FontAwesomeIcons.dog,
  //               color1: kPrimaryColor,
  //               texto: 'Gigante, mais de 40 quilos',
  //               onPress: () {
  //                 Get.to(DogAgeView());
  //               }),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
