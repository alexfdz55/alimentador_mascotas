import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRecomdacion extends StatelessWidget {
  final String text;

  const CardRecomdacion({required this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.2),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          this.text,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
