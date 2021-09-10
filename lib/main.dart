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
      title: 'Flutter Demo',
      theme: darkThemeData(),
      //home: prefs.isFirstInitApp ? IntroView() : BottomNavigationView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
