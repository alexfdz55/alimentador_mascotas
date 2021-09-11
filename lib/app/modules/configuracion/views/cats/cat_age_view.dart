import 'package:alimentador_mascote/app/models/cat_model.dart';
import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/cats/cat_peso_widget.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class CatAgeView extends GetView<ConfiguracionController> {
  final edades = Cat().edades;
  List<String> edadesList = [];
  String porte = '';

  @override
  Widget build(BuildContext context) {
    //print(edadesList);
    return CustomPage(
      isBack: true,
      title: 'Qual a idade do gato?',
      child: ListView.builder(
        itemBuilder: (__, index) {
          // print(edades[index]);
          for (var k in edades[index].keys) {
            // k -> portes
            // porte = k;
            edadesList.add(k);

            // print(edades[index][k]);
          }
          // print(portesList);
          // print(portes[index[]]);
          return BotonGordo(
              sizeIcon: index * 10 + 30,
              icon: FontAwesomeIcons.cat,
              color1: kPrimaryColor,
              texto: edadesList[index],
              onPress: () {
                final a = edades[index][edadesList[index]];
                //print(a);
                Get.to(CatPesoView(a!));

                // for (var k in portes[index].keys) {
                //   edades = portes[index][k];
                //   // a -> listas de cada  porte
                //   //print(edades);
                // }
                //Get.to();
              });
        },
        itemCount: edades.length,
      ),
    );
  }
}
