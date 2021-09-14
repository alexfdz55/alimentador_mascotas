import 'package:alimentador_mascote/app/modules/configuracion/views/entrar_datos_view.dart';
import 'package:alimentador_mascote/app/modules/home/components/header.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:alimentador_mascote/app/shared/widgets/button_personalizado.dart';
import 'package:alimentador_mascote/app/shared/widgets/configuraciones_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.3),
                end: FractionalOffset(0.0, 1.0),
                colors: [
                  Color(0xFF1D2F53),
                  Color(0xFF111927),
                ],
              ),
            ),
          ),
          _HomeBody(),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      height: responsive.height,
      decoration: BoxDecoration(
        // color: Color(0xFF151F27),
        //borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0,
            spreadRadius: 2.0,
            offset: Offset(1.0, 10.0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderHome(titleImage: 'mascotas-comiendo2'),
          Expanded(child: _HomeWidget()),
        ],
      ),
    );
  }
}

class _HomeWidget extends StatelessWidget {
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
            SizedBox(height: 30),
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
