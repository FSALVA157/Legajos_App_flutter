import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:legajos_app/models/personal_response.dart';

class PersonalProvider extends ChangeNotifier {
  String _baseURL = 'servidorcuerpospps.herokuapp.com';
  List<PersonalElement> personal_list = [];

  PersonalProvider() {
    this.getPersonal();
  }

  getPersonal() async {
    var url = Uri.https(_baseURL, '/personal');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    List<dynamic> lista_aux = json.decode(response.body);
    List<dynamic> lista = lista_aux[0];
    List<PersonalElement> listado = List<PersonalElement>.from(
        lista.map((x) => PersonalElement.fromMap(x)));
    this.personal_list = listado;

    notifyListeners();
  }
}
