import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'inicio.dart';
import 'contacto.dart';
import 'paginaweb.dart';
import 'menu.dart';

class tabsabajo extends StatefulWidget {
  @override
  _tabsabajoState createState() => _tabsabajoState();
}

class _tabsabajoState extends State<tabsabajo> {
  int mi_indice = 0;
  final pantallas = [
    inicio(),
    contacto(),
    paginaweb("https://olivegardenmexico.com.mx/"),
    menu()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.grey),
        home: Scaffold(
          body: IndexedStack(index: mi_indice, children: pantallas),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.black,
            iconSize: 40,
            currentIndex: mi_indice,
            onTap: (index) => setState(() => mi_indice = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Quiénes Somos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page), label: 'Contactanos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.web), label: 'Página Web'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank), label: 'Menu'),
            ],
          ),
        ));
  }
}
