import 'package:alimentador_mascote/app/modules/configuracion/views/tipo_mascota.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class ConfiguracionView extends GetView<ConfiguracionController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      isBack: false,
      // title: 'O Pet a ser alimentado é um:',
      child: ButtonAzul(
        paddingH: 50,
        color: kPrimaryColor,
        fontSize: 16,
        title: 'Cadastrar novo Pet',
        onPressed: () => Get.to(TipoMascotaView()),
      ),
    );
  }
}
