import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Api> fetchApi() async {
  final response =
      await http.get(Uri.parse('https://foodish-api.herokuapp.com/api/'));
  print(response);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Api.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Este ID de personaje no se encuentra en la galeria (Total 671)');
  }
}

class Api {
  final String image;

  Api({required this.image});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      image: json['image'],
    );
  }
}

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  late Future<Api> futureApi;

  @override
  void initState() {
    super.initState();
    futureApi = fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Center(
                child: Text(
                  "Nuestro Platillo del mes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: FutureBuilder<Api>(
                future: futureApi,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //return Text(snapshot.data!.image);
                    return Image(image: NetworkImage(snapshot.data!.image));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
