import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:legajos_app/models/personal_response.dart';

class PersonalProvider extends ChangeNotifier {
  String _baseURL = 'servidorcuerpospps.herokuapp.com';

  PersonalProvider() {
    print('Personal Provider inicializado');
    this.getPersonal();
  }

  getPersonal() async {
    var url = Uri.https(_baseURL, '/personal');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    List<dynamic> data = json.decode(response.body);
    var personalResponse = PersonalElement.fromJson(data[0].toString());
    print(personalResponse.foto);
  }
}
