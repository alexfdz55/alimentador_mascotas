import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroController extends GetxController {
  late List<PageViewModel> pages;

  @override
  void onInit() {
    pages = [page1, page2, page3];
    super.onInit();
  }

  final page1 = PageViewModel(
    //pageColor: Colors.pink,
    // pageBackground: Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       stops: [0.0, 1.0],
    //       begin: FractionalOffset.topCenter,
    //       end: FractionalOffset.bottomCenter,
    //       tileMode: TileMode.repeated,
    //       colors: [
    //         Colors.pink,
    //         Colors.orange,
    //       ],
    //     ),
    //   ),
    // ),
    title: const Text('Mascote'),
    body: const Text('Informação a ser exibida'),
    // iconImageAssetPath: 'assets/air-hostess.png',
    bubble: Image.asset('assets/mascotas-comiendo.jpg'),
    // titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    // bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    mainImage: Image.asset(
      'assets/mascotas-comiendo.jpg',
      height: 400.0,
      width: 300.0,
      alignment: Alignment.center,
    ),
  );

  final page2 = PageViewModel(
    // pageColor: Colors.purple,
    iconImageAssetPath: 'assets/mascotas-comiendo2.jpg',
    title: const Text('Mascotas'),
    body: const Text('Informação a ser exibida'),
    mainImage: Image.asset(
      'assets/mascotas-comiendo2.jpg',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
  );

  final page3 = PageViewModel(
    pageBackground: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     stops: [0.0, 1.0],
        //     begin: FractionalOffset.topCenter,
        //     end: FractionalOffset.bottomCenter,
        //     tileMode: TileMode.repeated,
        //     colors: [
        //       Colors.blue,
        //       Colors.blueAccent,
        //     ],
        //   ),
        // ),
        ),
    iconImageAssetPath: 'assets/comida.png',
    title: const Text(
      'Alimentador de mascote',
      textAlign: TextAlign.center,
    ),
    body: const Text('Informação a ser exibida'),
    mainImage: Image.asset(
      'assets/comida.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    // titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    // bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  );
}
