import 'package:alimentador_mascote/app/modules/configuracion/components/card_info_config.dart';
import 'package:alimentador_mascote/app/modules/home/components/time_card.dart';
import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:alimentador_mascote/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ConfiguracionesWidget extends StatelessWidget {
  String tipoMascota = '';

  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    if (prefs.isDog) {
      tipoMascota = 'Cachorro';
    } else if (prefs.isCat) {
      tipoMascota = 'Gato';
    } else if (prefs.isOther) {
      tipoMascota = 'Outro';
    } else {
      tipoMascota = '';
    }
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(tipoMascota, style: TextStyle(fontSize: 17)),
            ),
          ),
          SizedBox(height: 20),
          CardInfoConfig(
            icon: FontAwesomeIcons.balanceScale,
            text: 'Peso diário',
            config: prefs.pesoComidaDiario.toString() + ' g',
          ),
          CardInfoConfig(
            icon: FontAwesomeIcons.utensils,
            text: 'Peso por refeição',
            config: prefs.pesoComida.toString() + ' g',
          ),
          SizedBox(height: 20),
          prefs.cantidadComidas == 0
              ? _CardNoHayHorarios(
                  icon: FontAwesomeIcons.timesCircle,
                  text: 'Não há horário definido',
                )
              : Container(
                  //color: Colors.red,
                  height: responsive.wp(30) * 1,
                  child: ListView.builder(
                    itemBuilder: (__, index) {
                      return TimeCard(hour: prefs.horas[index]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: prefs.cantidadComidas,
                  ),
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CardNoHayHorarios extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;

  const _CardNoHayHorarios(
      {required this.icon, required this.text, this.iconSize = 30});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 4.0)),
        ],
        //color: Colors.white.withAlpha(180),
        color: Colors.white.withOpacity(0.3),
      ),
      width: responsive.wp(80),
      height: 70,
      child: Center(
        child: ListTile(
          leading: Icon(
            this.icon,
            size: this.iconSize,
          ),
          title: Text(this.text),
        ),
      ),
    );
  }
}
