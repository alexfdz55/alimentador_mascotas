import 'package:alimentador_mascote/app/modules/bottom_navigation/views/tabs_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/share_prefs/preferencias_usuario.dart';
import 'app/shared/theme/theme_dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
  //MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hora da ração',
      theme: darkThemeData(),
      //home: prefs.isFirstInitApp ? IntroView() : BottomNavigationView(),
      home: TabsPage(),

      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    );
  }
}
