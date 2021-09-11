import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';

class CardInfoConfig extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final String config;

  const CardInfoConfig(
      {required this.icon,
      required this.text,
      required this.config,
      this.iconSize = 30});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
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
          trailing: Container(
              constraints: BoxConstraints(
                maxHeight: 40,
                maxWidth: 150,
              ),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 4.0)),
                ],
                //color: Colors.white.withAlpha(180),
                color: Colors.green.shade700,
              ),
              child: Center(
                  child: Text(
                this.config,
                style: TextStyle(fontSize: 18),
              ))),
        ),
      ),
    );
  }
}