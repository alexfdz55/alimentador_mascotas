import 'package:alimentador_mascote/app/modules/configuracion/components/card_recomedacion.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/hora_comida_widget.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/tilte_input.dart';

import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:alimentador_mascote/app/shared/widgets/textfield_custom_New1.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class EntrarDatosView extends GetView<ConfiguracionController> {
  final String infoText;

  EntrarDatosView(this.infoText);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfiguracionController>(
      init: ConfiguracionController(),
      builder: (_) => CustomPage(
        isBack: true,
        title: 'Recomenda-se',
        child: Container(
            // height: 200,
            // color: Colors.red,
            child: SingleChildScrollView(
          child: Column(
            children: [
              CardRecomdacion(text: this.infoText),
              TitleInput(
                text:
                    'Insira a quantidade de ração a ser servida em cada refeição?(em gramas)',
              ),
              TextFieldCustom(
                  controller: _.pesoTextController,
                  textValidation: '',
                  textInputType: TextInputType.number,
                  icon: Icons.food_bank_outlined,
                  onChanged: () {}),
              TitleInput(
                text: 'Insira a quantidade de refeições diárias',
              ),
              // SizedBox(height: 30),
              TextFieldCustom(
                  controller: _.comidasTextController,
                  // hintText: 'Quantidade de refeições no dia',
                  textValidation: '',
                  textInputType: TextInputType.number,
                  icon: Icons.food_bank_outlined,
                  onChanged: () {
                    int n = 0;
                    final c = _.comidasTextController.text.toString();
                    if (c == '') {
                      n = 0;
                      _.horasComidas = [];
                      _.update();
                    }

                    if (c == '0') {
                      _.horasComidas = [];
                      _.update();
                    } else {
                      n = int.parse(_.comidasTextController.text.toString());
                      for (var i = 1; i < n + 1; i++) {
                        _.horasComidas.add(HoraComida(index: i));
                      }
                      _.update();
                    }
                    FocusScope.of(context).requestFocus(new FocusNode());
                  }),
              SizedBox(height: 40),
              Column(children: _.horasComidas),
              SizedBox(height: 20),
              ButtonAzul(
                  color:
                      _.horasComidas.length == 0 ? Colors.grey : Colors.green,
                  title: 'Configurar',
                  onPressed: () {}),
              SizedBox(height: 100),
            ],
          ),
        )),
      ),
    );
  }
}
