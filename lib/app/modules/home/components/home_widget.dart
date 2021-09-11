import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/configuraciones_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  // Now, its time to build the UI
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ConfiguracionesWidget(),
            ButtonAzul(
                paddingH: 40,
                color: kPrimaryColor,
                title: 'Cambiar',
                onPressed: () => Get.to(EntrarDatosView('')))
          ],
        ),
      ),
    );
  }
}
