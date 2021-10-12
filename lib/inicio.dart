import 'dart:ui';

import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('¿Quienes somos?')),
        body: Center(
          child: Column(children: [
            Container(
              height: 50,
              child: Center(
                child: Text(
                  "Bienvenido a Olive Garden",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.green.withOpacity(1.0)),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Text(
                  "Restaurante para toda la familia",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.green.withOpacity(0.5)),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Text(
                    "Somos una cadena de restaurantes de comida italiana fundada en 1982. Queremos que en nuestro restaurante siempre te sientas como en casa",
                    style:
                        TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
              ),
            ),
            Container(
              height: 250,
              child: Center(
                  child: Image(
                      image: NetworkImage(
                          "https://resizer.otstatic.com/v2/photos/wide-huge/1/24012706.jpg"))),
            ),
            Container(
              height: 25,
              child: Center(
                child: Text(
                  "Nuestro Equipo:",
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              height: 250,
              child: Center(
                  child: Image(
                      image: NetworkImage(
                          "http://media.olivegarden.com/images/site/ext/pages/_promotions/new-careers/about-our-family/about-family-03.jpg"))),
            ),
          ]),
        ));
  }
}
