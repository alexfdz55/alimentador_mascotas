import 'package:alimentador_mascote/app/models/cat_model.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class CatPesoView extends GetView<ConfiguracionController> {
  final List<Map<String, String>> pesos;
  final pesosList = [];

  CatPesoView(this.pesos);

  @override
  Widget build(BuildContext context) {
    //print(edadesList);
    return CustomPage(
      isBack: true,
      title: 'Qual a idade do gato?',
      child: ListView.builder(
        itemBuilder: (__, index) {
          // // print(edades[index]);
          for (var k in pesos[index].keys) {
            // k -> portes
            // porte = k;
            pesosList.add(k);
            print(k);
            //print(pesos[index][k]);
          }
          // print(portesList);
          // print(portes[index[]]);
          return BotonGordo(
              sizeIcon: index * 10 + 20,
              icon: FontAwesomeIcons.cat,
              color1: kPrimaryColor,
              texto: pesosList[index],
              onPress: () {
                Get.to(EntrarDatosView(pesos[index][pesosList[index]]!));
              });
        },
        itemCount: pesos.length,
      ),
    );
  }
}
