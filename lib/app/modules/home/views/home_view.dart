import 'package:alimentador_mascote/app/modules/home/components/home_body.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.3),
                end: FractionalOffset(0.0, 1.0),
                colors: [
                  Color(0xFF1D2F53),
                  Color(0xFF111927),
                ],
              ),
            ),
          ),
          HomeBody(),
        ],
      ),
    );
  }
}
