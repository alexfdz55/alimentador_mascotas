import 'package:alimentador_mascote/app/modules/info_edad/views/info_edad_view.dart';
import 'package:alimentador_mascote/app/modules/infos/controllers/infos_controller.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InfosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfosController>(
      init: InfosController(),
      builder: (_) => Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.info),
            centerTitle: true,
            title: Text('Em formação'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                ButtonAzul(
                  color: kPrimaryColor,
                  title: 'É um ﬁlhote de que faixa de idade',
                  onPressed: () {
                    Get.to(OpcionesEdadView());
                  },
                ),
                ButtonAzul(
                  color: kPrimaryColor,
                  title: 'Qual a idade dele?',
                  onPressed: () {},
                ),
                ButtonAzul(
                  color: kPrimaryColor,
                  title: 'Qual o porte dele?',
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
