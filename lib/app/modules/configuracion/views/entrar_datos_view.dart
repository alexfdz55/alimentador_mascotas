import 'package:alimentador_mascote/app/modules/configuracion/components/card_recomedacion.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/hora_comida_widget.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/tilte_input.dart';
import 'package:alimentador_mascote/app/modules/configuracion/components/time_widget.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/rutina_comidas.dart';
import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';

import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_page.dart';
import 'package:alimentador_mascote/app/shared/widgets/textfield_custom_New1.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class EntrarDatosView extends GetView<ConfiguracionController> {
  final String infoText;

  EntrarDatosView(this.infoText);
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GetBuilder<ConfiguracionController>(
      init: ConfiguracionController(),
      builder: (_) => CustomPage(
        isBack: true,
        title: this.infoText == '' ? '' : 'Recomenda-se',
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              this.infoText == ''
                  ? Container()
                  : CardRecomdacion(text: this.infoText),
              TitleInput(
                text:
                    'Insira a quantidade de ração a ser servida em cada refeição?(em gramas)',
              ),
              TextFieldCustom(
                  controller: _.pesoTextController,
                  textValidation: '',
                  textInputType: TextInputType.number,
                  icon: FontAwesomeIcons.utensils,
                  onChanged: () {
                    _.saveDatos();
                  }),
              TitleInput(text: 'Insira a quantidade de refeições diárias'),
              // SizedBox(height: 30),
              TextFieldCustom(
                  controller: _.comidasTextController,
                  // hintText: 'Quantidade de refeições no dia',
                  textValidation: '',
                  textInputType: TextInputType.number,
                  icon: FontAwesomeIcons.question,
                  onChanged: () {
                    _.saveDatos();
                    if (_.comidasTextController.text != '')
                      FocusScope.of(context).requestFocus(new FocusNode());
                  }),
              SizedBox(height: 10),

              TitleInput(text: 'Horas de refeições'),
              Container(
                  //color: Colors.red,
                  height: responsive.wp(45) * 1.4,
                  child: _HorasDialog()),
              ButtonAzul(
                  color: _.horas.length == 0 ? Colors.grey : Colors.green,
                  title: 'Configurar',
                  onPressed: () {
                    _.sendData();
                    Get.to(
                      RutinaComidaView(),
                    );
                  }),
              SizedBox(height: 10),
            ],
          )),
        ),
      ),
    );
  }
}

class _HorasDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfiguracionController>(
      init: ConfiguracionController(),
      id: 'horarios',
      builder: (_) => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HoraComida(index: index + 1),
        itemCount: _.cantidadComidas, /////allCategories.length,
        separatorBuilder: (_, index) => SizedBox(
          width: 5,
        ),
      ),

      // ListView.builder(
      //     itemBuilder: (__, index) {
      //       return Column(
      //         children: [
      //           HoraComida(index: index + 1),
      //           (index + 1 == _.cantidadComidas)
      //               ? Column(
      //                   children: [
      //                     ButtonAzul(
      //                         color: _.horas.length == 0
      //                             ? Colors.grey
      //                             : Colors.green,
      //                         title: 'Configurar',
      //                         onPressed: () => Get.to(RutinaComidaView())),
      //                     SizedBox(height: 40),
      //                   ],
      //                 )
      //               : Container()
      //         ],
      //       );
      //     },
      //     itemCount: _.cantidadComidas),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  final Widget child;

  const _CustomContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 4.0)),
          ],
          //color: Colors.white.withAlpha(180),
          color: Get.theme.canvasColor),
      height: 70,
      child: this.child,
    );
  }
}

customDialog({
  String title = '',
  required Widget child,
  bool error = true,
  required Function action,
  bool dismissible = true,
}) {
  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text(
        title,
        style: TextStyle(color: Colors.green, fontSize: 28),
        textAlign: TextAlign.center,
      ),
      content: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          child
          //SettingsWidget()
        ],
      ),
      actions: <Widget>[
        ButtonAzul(
            color: Get.theme.primaryColor,
            title: 'Aceptar',
            height: 40,
            fontSize: 15,
            onPressed: () {
              Get.back();
              action();
            })
        // TextButton(
        //     child: Text('Aceptar'),
        //     onPressed: () {
        //       Get.back();
        //     }),
      ],
    ),
    barrierDismissible: dismissible,
  );
}
