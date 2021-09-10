import 'package:alimentador_mascote/app/modules/configuracion/components/time_widget.dart';
import 'package:alimentador_mascote/app/shared/widgets/text_title.dart';
import 'package:flutter/material.dart';

class HoraComida extends StatelessWidget {
  final int index;
  const HoraComida({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextTitle(
              title: 'Hora da refeição $index',
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
