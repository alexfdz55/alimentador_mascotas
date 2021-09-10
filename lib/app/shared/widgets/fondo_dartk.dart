import 'package:flutter/material.dart';

var fondoDark = Stack(children: <Widget>[
  Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset(0.0, 0.3),
        end: FractionalOffset(0.0, 1.0),
        colors: [
          //Color(0xFF3C4A65)
          Color(0xFF1D2F53),
          Color(0xFF111927),
        ],
      ),
    ),
    child: SafeArea(
      child: Stack(
        children: [
          Positioned(
            right: 20,
            child: Image.asset(
              'assets/icon.png',
              width: 60,
              height: 60,
            ),
          )
        ],
      ),
    ),
  ),
]);
