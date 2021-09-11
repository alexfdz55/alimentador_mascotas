import 'dart:convert';
import 'package:alimentador_mascote/app/shared/theme/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketEspView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ConfiEspWifi()
        ],
      ),
    );
  }
}

class ConfiEspWifi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfiEspWifi();
  }
}

class _ConfiEspWifi extends State<ConfiEspWifi> {
  late String temp; //variable for temperature
  late String humidity; //variable for humidity
  late String heatindex; //variable for heatindex

  late IOWebSocketChannel channel;
  late bool connected; //boolean value to track if WebSocket is connected
  late bool ledstatus; //boolean value to track LED status, if its ON or OFF

  // String url = '192.168.0.1:81';
  String url = '192.168.0.1:81';
  String msg = '';

  @override
  void initState() {
    initConection();
    // connected = false; //initially connection status is "NO" so its FALSE

    // temp = "0"; //initial value of temperature
    // humidity = "0"; //initial value of humidity
    // heatindex = "0"; //initial value of heatindex

    // Future.delayed(Duration.zero, () async {
    //   channelconnect(); //connect to WebSocket wth NodeMCU
    // });

    super.initState();
  }

  initConection() {
    msg = 'Conectando con: $url';
    ledstatus = false;
    connected = false; //initially connection status is "NO" so its FALSE

    temp = "0"; //initial value of temperature
    humidity = "0"; //initial value of humidity
    heatindex = "0"; //initial value of heatindex

    Future.delayed(Duration.zero, () async {
      channelconnect(); //connect to WebSocket wth NodeMCU
    });
  }

  channelconnect() {
    //function to connect
    try {
      channel = IOWebSocketChannel.connect("ws://$url");
      //channel IP : Port
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true; //message is "connected" from NodeMCU
            }
            //
            else if (message == "poweron:success") {
              ledstatus = true;
            }
            //
            else if (message == "poweroff:success") {
              ledstatus = false;
            }

            //
            else if (message.substring(0, 6) == "{'temp") {
              //check if the resonse has {'temp on it
              message = message.replaceAll(RegExp("'"), '"');
              Map<String, dynamic> jsondata =
                  json.decode(message); //decode json to array
              setState(() {
                temp = jsondata["temp"]; //temperature value
                humidity = jsondata["humidity"]; //humidity value
                heatindex = jsondata["heat"]; //heatindex value
              });
            }
            //you can apply "if elese - else if for more message type from NodeMCU"
          });
        },
        onDone: () {
          //if WebSocket is disconnected

          print("Web socket is closed");
          setState(() {
            msg = 'Websocket se ha cerrado';
            connected = false;
          });
        },
        onError: (error) {
          setState(() {
            msg = 'No se ha podido conectar con el NodeMCU';
          });
          print(error.toString());
        },
      );
    } catch (_) {
      msg = 'Error al conectar con el NodeMCU';
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendcmd(String cmd) async {
    if (connected == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        print("Send the valid command");
      } else {
        channel.sink.add(cmd); //sending Command to NodeMCU
      }
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Icon(Icons.wifi),
        centerTitle: true,
        title: Text("Conectar con esp32"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter, //inner widget alignment to center
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              statusWidget(),
              SizedBox(height: 10),
              readDataWidget(),
              SizedBox(height: 40),
              ledWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Conectar con 192.168.0.1:81',
        child: Icon(Icons.play_arrow),
        onPressed: initConection,
      ),
    );
  }

  readDataWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Lectura de datos",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.flash_on_outlined,
              color: Colors.blue,
              size: 30,
            ),
            title: Text(
              "A0: $temp",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.blue,
              size: 30,
            ),
            title:
                Text("Incremento: $humidity", style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            leading: Icon(
              Icons.exposure_minus_1,
              color: Colors.blue,
              size: 30,
            ),
            title:
                Text("Decremento: $heatindex", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  ledWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Text(
            "Controlar Led",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20),
          ledstatus
              ? Icon(FontAwesomeIcons.lightbulb, color: Colors.black, size: 50)
              : Icon(FontAwesomeIcons.solidLightbulb,
                  color: Colors.yellow, size: 50),
          SizedBox(height: 20),
          Text(
            ledstatus ? "Led apagado" : "Led encendido",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(height: 20),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //button to start scanning
            color: ledstatus ? Colors.green : Colors.redAccent,
            colorBrightness: Brightness.dark,
            onPressed: () {
              //on button press
              if (ledstatus) {
                //if ledstatus is true, then turn off the led
                //if led is on, turn off
                sendcmd("poweroff");
                ledstatus = false;
              } else {
                //if ledstatus is false, then turn on the led
                //if led is off, turn on
                sendcmd("poweron");
                ledstatus = true;
              }
              setState(() {});
            },
            child: ledstatus ? Text("Encender Led") : Text("Apagar Led"),
          ),
        ],
      ),
    );
  }

  statusWidget() {
    return Column(
      children: [
        connected
            ? Text(
                "WEBSOCKET: Conectado",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )
            : Text(
                "WEBSOCKET: Desconectado",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
        SizedBox(height: 30),
        connected
            ? Container()
            : Text(
                msg,
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
        SizedBox(height: 20),
        Container(
          height: connected ? 0 : 50,
          width: connected ? 0 : 50,
          // color: Colors.green,
          child: connected ? Container() : CircularProgressIndicator(),
        ),
      ],
    );
  }
}
