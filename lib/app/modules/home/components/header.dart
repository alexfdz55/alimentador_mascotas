import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final String titleImage;
  // final double height;

  HeaderHome({
    required this.titleImage,
    // required this.height
  });
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Stack(
      children: [
        Container(
          height: responsive.height - 620,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            // color: Colors.blue,
            image: DecorationImage(
                image: AssetImage('assets/$titleImage.jpg'), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: responsive.height - 620,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.black.withOpacity(0.60)),
          child: Center(
            child: Text(
              'Rotina de refeições',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
