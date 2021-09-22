import 'package:alimentador_mascote/app/modules/bottom_navigation/components/tab_navigation_item.dart';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kSecondaryColor,
          backgroundColor: Color(0xFF111927),
          currentIndex: _currentIndex,
          onTap: (int index) => setState(() => _currentIndex = index),
          items: <BottomNavigationBarItem>[
            for (final tabItem in TabNavigationItem.items)
              BottomNavigationBarItem(
                icon: tabItem.icon,
                title: tabItem.title,
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            elevation: 50,
            backgroundColor: Color.fromRGBO(0, 54, 101, 1.0),
            title: new Text('¿Seguro qué desea salir de la app?'),
            //content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Sí'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
