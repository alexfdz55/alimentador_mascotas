import 'package:alimentador_mascote/app/modules/info_edad/components/edades_mascotas.dart';
import 'package:alimentador_mascote/app/modules/info_edad/controllers/info_edad_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpcionesEdadView extends StatelessWidget {
  const OpcionesEdadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('É um ﬁlhote de que faixa de idade'),
      ),
      body: EdadesMascotasWidget(),
    );
  }
}

class InfoEdadView extends StatelessWidget {
  final String edad;

  const InfoEdadView({required this.edad});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GetBuilder<InfoEdadController>(
      init: InfoEdadController(),
      builder: (_) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(this.edad),
          ),
          body: Center(
              child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(width: 3, color: Colors.black54)),
            elevation: 10,
            child: Container(
                width: responsive.width * 0.8,
                height: 200,
                child: Center(child: Text('Informação a ser exibida'))),
          ))),
    );
  }
}
