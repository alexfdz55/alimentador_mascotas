import 'package:alimentador_mascote/app/modules/bottom_navigation/views/tabs_page.dart';
import 'package:get/get.dart';

import 'package:alimentador_mascote/app/modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import 'package:alimentador_mascote/app/modules/configuracion/bindings/configuracion_binding.dart';
import 'package:alimentador_mascote/app/modules/configuracion/views/configuracion_view.dart';
import 'package:alimentador_mascote/app/modules/home/bindings/home_binding.dart';
import 'package:alimentador_mascote/app/modules/home/views/home_view.dart';
import 'package:alimentador_mascote/app/modules/info_edad/bindings/info_edad_binding.dart';
import 'package:alimentador_mascote/app/modules/info_edad/views/info_edad_view.dart';
import 'package:alimentador_mascote/app/modules/infos/bindings/infos_binding.dart';
import 'package:alimentador_mascote/app/modules/infos/views/infos_view.dart';
import 'package:alimentador_mascote/app/modules/intro_page/bindings/intro_page_binding.dart';
import 'package:alimentador_mascote/app/modules/intro_page/views/intro_page_view.dart';
import 'package:alimentador_mascote/app/modules/web_socket_connection/bindings/web_socket_connection_binding.dart';
import 'package:alimentador_mascote/app/modules/web_socket_connection/views/web_socket_connection_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => TabsPage(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.WEB_SOCKET_CONNECTION,
      page: () => WebSocketEspView(),
      binding: WebSocketConnectionBinding(),
    ),
    GetPage(
      name: _Paths.INTRO_PAGE,
      page: () => IntroView(),
      binding: IntroPageBinding(),
    ),
    GetPage(
      name: _Paths.INFO_EDAD,
      page: () => InfoEdadView(
        edad: '',
      ),
      binding: InfoEdadBinding(),
    ),
    GetPage(
      name: _Paths.INFOS,
      page: () => InfosView(),
      binding: InfosBinding(),
    ),
    GetPage(
      name: _Paths.CONFIGURACION,
      page: () => ConfiguracionView(),
      binding: ConfiguracionBinding(),
    ),
  ];
}
