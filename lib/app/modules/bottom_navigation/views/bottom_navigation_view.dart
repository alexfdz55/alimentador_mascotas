import 'package:alimentador_mascote/app/modules/home/views/home_view.dart';
import 'package:alimentador_mascote/app/modules/infos/views/infos_view.dart';
import 'package:alimentador_mascote/app/modules/web_socket_connection/views/web_socket_connection_view.dart';
import 'package:alimentador_mascote/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  late Color kColor;
  final prefs = PreferenciasUsuario();
  bool isAddBtnVisible = true;
  late Color textColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (_) => WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: _showSelectedPage(_),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: bottomAppBar(_),
          ),
        ),
      ),
    );
  }

  bottomAppBar(BottomNavigationController _) {
    return GNav(
      tabBackgroundColor: kSecondaryColor,
      backgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).scaffoldBackgroundColor,
      activeColor: Theme.of(context).primaryColor,
      tabBorderRadius: 20,
      tabMargin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: Duration(milliseconds: 400),
      tabs: iconsBottomBar(),
      selectedIndex: _.tabIndex,
      onTabChange: (index) {
        _.tabIndex = index;
        _.update();
      },
    );
  }

  iconsBottomBar() {
    return [
      GButton(
        icon: Icons.wifi,
        // text: 'Agendar',
      ),
      GButton(
        icon: FontAwesomeIcons.home,

        //text: 'Estudios',
      ),
      GButton(
        icon: Icons.info,
        // text: 'Home',
      ),
    ];
  }

  _showSelectedPage(BottomNavigationController _) {
    // switch (widget.activeIndex) {
    switch (_.tabIndex) {
      case 0:
        this.isAddBtnVisible = false;
        //this.setState(() {});
        return WebSocketEspView();

      case 1:
        this.isAddBtnVisible = true;
        //this.setState(() {});
        return HomeView();

      case 2:
        this.isAddBtnVisible = true;
        //this.setState(() {});
        return InfosView();
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            elevation: 50,
            backgroundColor: Theme.of(context).backgroundColor,
            title: new Text(
              '¿Estás seguro qué deseas salir de la app?',
            ),
            //content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Sí'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
