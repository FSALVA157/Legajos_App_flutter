import 'package:flutter/material.dart';
import 'package:legajos_app/models/personal_response.dart';
import 'package:legajos_app/providers/personal_provider.dart';
import 'package:provider/provider.dart';

class PersonalSearchDelegate extends SearchDelegate {
  //final BuildContext context;

  List<PersonalElement> lista_completa = PersonalProvider().personal_list;

  PersonalSearchDelegate() {
    //PersonalProvider().getPersonal();
    //this.lista_completa = PersonalProvider().personal_list;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = "", icon: Icon(Icons.clear))];
  }

  // ignore: non_constant_identifier_names

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('build Result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
          child:
              Icon(Icons.person_off_outlined, color: Colors.black38, size: 100),
        ),
      );
    } else {
      print(this.lista_completa);
      return Center(
        child: Text('HAY CONSULTA'),
      );
    }
  }
}
