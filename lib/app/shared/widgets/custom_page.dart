import 'package:alimentador_mascote/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPage extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool isBack;

  const CustomPage({required this.child, this.title, this.isBack = true});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: responsive.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            this.isBack
                                ? Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: IconButton(
                                      color: Colors.white60,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 30,
                                      ),
                                      onPressed: () => Get.back(),
                                    ),
                                  )
                                : Container(height: 50),
                            this.title != null
                                ? Center(
                                    child: Container(
                                      height: 35,
                                      // color: Colors.red,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        this.title!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                          //color: Colors.green,
                          height: responsive.height - 122,
                          child: this.child)
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20,
                child: Image.asset('assets/logo.png', width: 50, height: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
