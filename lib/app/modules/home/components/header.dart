import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderHome extends StatelessWidget {
  final String titleImage;
  // final double height;

  final _ = Get.put(HomeController());

  HeaderHome({
    required this.titleImage,
    // required this.height
  });
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Stack(
      children: [
        Container(
          height: responsive.height - 620,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            // color: Colors.blue,
            image: DecorationImage(
                image: AssetImage('assets/$titleImage.jpg'), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: responsive.height - 620,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.black.withOpacity(0.60)),
          child: Center(
            child: Text(
              'Rotina de refeições',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: responsive.height - 620,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() => _statusWidget()),
          ),
        )
      ],
    );
  }

  _statusWidget() {
    final fontSize = 14.0;
    return Padding(
      padding: EdgeInsets.only(left: 25, bottom: 15),
      child: Row(
        children: [
          _.connected.value
              ? Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Icon(Icons.wifi_outlined),
                      SizedBox(width: 10),
                      Text(
                        " Conectado",
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ))
              : Container(
                  child: Row(
                    children: [
                      Icon(Icons.wifi_off, color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        " Desconectado",
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
          SizedBox(width: 20),
          Container(
              height: _.connected.value ? 0 : 40,
              width: _.connected.value ? 0 : 180,
              //color: Colors.red,
              child: _.connected.value
                  ? Container()
                  : Container(
                      //color: Colors.red,
                      height: 30,
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tentando se conectar',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )),
        ],
      ),
    );
  }
}
