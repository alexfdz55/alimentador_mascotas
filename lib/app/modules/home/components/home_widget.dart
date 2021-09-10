import 'package:alimentador_mascote/app/modules/configuracion/components/time_widget.dart';
import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/widgets/text_title.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';

import 'package:alimentador_mascote/app/shared/widgets/textfield_custom_New1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  // Now, its time to build the UI
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => body(context, _),
    );
  }

  body(BuildContext context, HomeController _) {
    return Expanded(
      // margin: EdgeInsets.only(top: 10),
      //color: Colors.blue.shade100,
      //height: 400,
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
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
                color: _.horasComidas.length == 0 ? Colors.grey : Colors.green,
                title: 'Configurar',
                onPressed: () {}),
            SizedBox(height: 100),
          ],
        ),
      )),
    );
  }
}

class HoraComida extends StatelessWidget {
  final int index;
  const HoraComida({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextTitle(
              title: 'Hora de comida $index',
              color: Colors.white,
              fontSize: 20),
          SizedBox(height: 10),
          TimetWidget(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
