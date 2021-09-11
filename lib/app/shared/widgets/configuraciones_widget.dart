import 'package:alimentador_mascote/app/modules/configuracion/components/card_info_config.dart';
import 'package:alimentador_mascote/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfiguracionesWidget extends StatelessWidget {
  String tipoMascota = '';

  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    if (prefs.isDog) {
      tipoMascota = 'Cachorro';
    } else if (prefs.isCat) {
      tipoMascota = 'Gato';
    } else if (prefs.isOther) {
      tipoMascota = 'Outro';
    } else {
      tipoMascota = '';
    }
    return Column(
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
        CardInfoConfig(
          icon: Icons.watch_later_outlined,
          iconSize: 35,
          text: 'Hora da 1ª refeição',
          config: '__',
        ),
        CardInfoConfig(
          icon: Icons.watch_later_outlined,
          iconSize: 35,
          text: 'Hora da 2ª refeição',
          config: '__',
        )
      ],
    );
  }
}
