import 'package:alimentador_mascote/app/modules/configuracion/views/cats/cat_age_view.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/dogs/dog_size_view.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class TipoMascotaView extends GetView<ConfiguracionController> {
  final _ = Get.put(ConfiguracionController());
  @override
  Widget build(BuildContext context) {
    return CustomPage(
        isBack: true,
        title: 'O Pet a ser alimentado é um:',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              BotonGordo(
                  icon: FontAwesomeIcons.dog,
                  color1: kPrimaryColor,
                  texto: 'Cachorro',
                  onPress: () {
                    _.setDog();
                    Get.to(DogSizeView());
                  }),
              BotonGordo(
                  icon: FontAwesomeIcons.cat,
                  color1: kPrimaryColor,
                  texto: 'Gato',
                  onPress: () {
                    _.setCat();
                    Get.to(CatAgeView());
                  }),
              BotonGordo(
                  icon: Icons.pets,
                  color1: kPrimaryColor,
                  texto: 'Outro',
                  onPress: () {
                    _.serOther();
                    Get.to(EntrarDatosView(
                        'Independentemente do tipo, ida -de  ou  porte  do  animal, que um especialista seja consultado pa -ra previnir disturbios alimentares'));
                    // Get.to(
                    //   InfoEdadView(
                    //     edad: '2 a 3 meses',
                    //   ),
                    // );
                  }),
            ],
          ),
        ));
  }
}
