import 'package:alimentador_mascote/app/modules/bottom_navigation/views/bottom_navigation_view.dart';
import 'package:alimentador_mascote/app/modules/intro_page/controllers/intro_controller.dart';
import 'package:alimentador_mascote/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroView extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  // Making list of pages needed to pass in IntroViewsFlutter constructor.

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      init: IntroController(),
      builder: (_) => Builder(
        builder: (context) => IntroViewsFlutter(
          _.pages,
          nextText: Text('Segue'),
          skipText: Text('Pular'),
          doneText: Text('Feito'),
          backText: Text('Atrás'),
          doneButtonPersist: true,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            prefs.isFirstInitApp = false;
            // Use Navigator.pushReplacement if you want to dispose the latest route
            // so the user will not be able to slide back to the Intro Views.
            Get.off(BottomNavigationView());
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
