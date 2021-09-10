import 'package:alimentador_mascote/app/modules/info_edad/views/info_edad_view.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EdadesMascotasWidget extends StatelessWidget {
  const EdadesMascotasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Text('É um ﬁlhote de que faixa de idade?'),
          BotonGordo(
              icon: FontAwesomeIcons.dog,
              color1: kPrimaryColor,
              // color2: kSecondaryColor,
              texto: '2 a 3 meses',
              onPress: () {
                Get.to(InfoEdadView(
                  edad: '2 a 3 meses',
                ));
              }),
          BotonGordo(
              icon: FontAwesomeIcons.dog,
              color1: kPrimaryColor,
              // color2: kSecondaryColor,
              texto: '4 a 5 meses',
              onPress: () {
                Get.to(InfoEdadView(
                  edad: '4 a 5 meses',
                ));
              }),
          BotonGordo(
              icon: FontAwesomeIcons.dog,
              color1: kPrimaryColor,
              // color2: kSecondaryColor,
              texto: '6 a 7 meses',
              onPress: () {
                Get.to(InfoEdadView(
                  edad: '6 a 7 meses',
                ));
              }),
          BotonGordo(
              icon: FontAwesomeIcons.dog,
              color1: kPrimaryColor,
              // color2: kSecondaryColor,
              texto: '8 meses',
              onPress: () {
                Get.to(InfoEdadView(
                  edad: '8 meses',
                ));
              }),
        ],
      ),
    );
  }
}
