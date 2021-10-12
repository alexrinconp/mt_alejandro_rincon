import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

class contacto extends StatefulWidget {
  @override
  _contactoState createState() => _contactoState();
}

class _contactoState extends State<contacto> {
  enviarsms(String msj, List<String> d) async {
    String r = await sendSMS(message: msj, recipients: d).catchError((onError) {
      print(onError);
    });
    print(r);
  }

  hacerllamada() async {
    const url = 'tel:+525537805596';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'error al llamar al $url';
    }
  }

  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    //Solo Android, iOS es más desmadre
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contactanos')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              height: 100,
              width: 300,
              child: TextButton(
                  child: Text('Llamada', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey, onPrimary: Colors.white),
                  onPressed: hacerllamada),
            ),
            Container(
                margin: EdgeInsets.all(25),
                height: 100,
                width: 300,
                child: TextButton(
                    child: Text('SMS', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey, onPrimary: Colors.white),
                    onPressed: () {
                      String msj = "Me gustaria realizar una reserva";
                      List<String> d = ["+525537805596"];
                      enviarsms(msj, d);
                    })),
            Container(
                margin: EdgeInsets.all(25),
                height: 100,
                width: 300,
                child: TextButton(
                    child: Text('WhatsApp', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey, onPrimary: Colors.white),
                    onPressed: () {
                      String msj = "Me gustaría realizar una reserva";
                      String destinatario = "+525537805596";
                      openwhatsapp(msj, destinatario);
                    })),
          ],
        ),
      ),
    );
  }
}
