import 'package:alimentador_mascote/app/modules/configuracion/controllers/configuracion_controller.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/cats/cat_age_view.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CatCastradoView extends GetView<ConfiguracionController> {
  final _ = Get.put(ConfiguracionController());
  @override
  Widget build(BuildContext context) {
    //print(edadesList);
    return CustomPage(
        isBack: true,
        title: 'O gato é castrado??',
        child: Column(
          children: [
            Spacer(),
            BotonGordo(
                icon: FontAwesomeIcons.cat,
                color1: kPrimaryColor,
                texto: 'Sim',
                onPress: () {
                  _.setCat();
                  Get.to(EntrarDatosView(
                      'Que  gatos castrados consumam ração para gatos castrados, ten -do em vista as  mudanças  sofri -das no processo. Procure um es-pecialista para não errar a dose.'));
                }),
            SizedBox(height: 60),
            BotonGordo(
                icon: FontAwesomeIcons.cat,
                color1: kPrimaryColor,
                texto: 'No',
                onPress: () {
                  _.setCat();
                  Get.to(CatAgeView());
                }),
            Spacer(),
          ],
        ));
  }
}
