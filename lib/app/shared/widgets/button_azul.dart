//import 'package:centro_ultrasonido/ui/pages/servicios/controller/servicios_controller.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double height;
  final double width;
  final double fontSize;
  final Color color;

  CustomButton(
      {required this.title,
      required this.onPressed,
      this.height = 30,
      this.fontSize = 15,
      this.width = 30,
      this.color = Colors.green});

  late Size size;

  @override
  Widget build(BuildContext context) {
    //final kColor = Theme.of(context).primaryColor;

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            height: this.height,
            minWidth: this.width,
            color: this.color,
            elevation: 6,
            padding: EdgeInsets.all(7.0),
            child: Text(
              this.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: this.fontSize,
                  fontWeight: FontWeight.w900),
            ),
            onPressed: this.onPressed()),
      ),
      //),
    );
  }
}
