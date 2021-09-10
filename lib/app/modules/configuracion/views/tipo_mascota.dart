import 'package:alimentador_mascote/app/modules/configuracion/views/perros/dog_size_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class TipoMascotaView extends GetView<ConfiguracionController> {
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
                    Get.to(DogSizeView());
                  }),
              BotonGordo(
                  icon: FontAwesomeIcons.cat,
                  color1: kPrimaryColor,
                  texto: 'Gato',
                  onPress: () {
                    // Get.to(
                    //   InfoEdadView(
                    //     edad: '2 a 3 meses',
                    //   ),
                    // );
                  }),
              BotonGordo(
                  icon: Icons.pets,
                  color1: kPrimaryColor,
                  texto: 'Outro',
                  onPress: () {
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
