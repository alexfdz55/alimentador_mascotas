import 'package:alimentador_mascote/app/modules/bottom_navigation/views/tabs_page.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/card_info_config.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/configuraciones_widget.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class RutinaComidaView extends GetView<ConfiguracionController> {
  String tipoMascota = '';
  final _ = Get.put(ConfiguracionController());

  @override
  Widget build(BuildContext context) {
    if (_.prefs.isDog) {
      tipoMascota = 'Cachorro';
    } else if (_.prefs.isCat) {
      tipoMascota = 'Gato';
    } else if (_.prefs.isOther) {
      tipoMascota = 'Outro';
    } else {
      tipoMascota = '';
    }
    return CustomPage(
      title: 'Rotina de refeições',
      child: SingleChildScrollView(
          child: Column(
        children: [
          ConfiguracionesWidget(),
          SizedBox(height: 40),
          _.prefs.isFirstInitApp
              ? Container()
              : ButtonAzul(
                  paddingH: 40,
                  color: kPrimaryColor,
                  title: 'Ir a Home',
                  onPressed: () => Get.to(
                    TabsPage(),
                  ),
                ),
        ],
      )),
    );
  }
}
