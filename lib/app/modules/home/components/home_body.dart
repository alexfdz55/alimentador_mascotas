import 'package:alimentador_mascote/app/modules/home/components/header.dart';
import 'package:alimentador_mascote/app/modules/home/components/home_widget.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SingleChildScrollView(
      child: Container(
        height: responsive.height,
        decoration: BoxDecoration(
          color: Color(0xFF151F27),
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
            HomeWidget(),
          ],
        ),
      ),
    );
  }
}
