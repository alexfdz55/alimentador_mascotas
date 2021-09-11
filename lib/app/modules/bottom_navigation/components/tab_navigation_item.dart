import 'package:alimentador_mascote/app/modules/configuracion/views/configuracion_view.dart';
import 'package:alimentador_mascote/app/modules/home/views/home_view.dart';
import 'package:alimentador_mascote/app/modules/web_socket_connection/views/web_socket_connection_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;
  final Color color;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    this.color = Colors.red,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: WebSocketEspView(),
          icon: Icon(Icons.wifi),
          title: Text("Conexão"),
        ),
        TabNavigationItem(
          page: HomeView(),
          icon: Icon(FontAwesomeIcons.home),
          title: Text("Casa"),
        ),
        TabNavigationItem(
          page: ConfiguracionView(),
          icon: Icon(Icons.info),
          title: Text("Em formação"),
        ),
      ];
}
