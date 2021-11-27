import 'package:flutter/material.dart';
import 'package:legajos_app/models/personal_response.dart';
import 'package:legajos_app/providers/personal_provider.dart';
import 'package:provider/provider.dart';

class PersonalSearchDelegate extends SearchDelegate {
  //final BuildContext context;
  List<PersonalElement> lista_completa;

  PersonalSearchDelegate({required this.lista_completa});

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
      return elementoVacio();
    } else {
      List<PersonalElement> listaResultado = this
          .lista_completa
          .where((persona) => persona.apellido1.contains(query))
          .toList();

      if (listaResultado.length == 0) {
        return elementoVacio();
      } else {
        return _listViewResp(miLista: listaResultado);
      }
      return Center(
        child: Text('HAY CONSULTA'),
      );
    }
  }

  Widget elementoVacio() {
    return Container(
      child: Center(
        child:
            Icon(Icons.person_off_outlined, color: Colors.black38, size: 100),
      ),
    );
  }
}

class _listViewResp extends StatelessWidget {
  List<PersonalElement> miLista;

  _listViewResp({required this.miLista});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: miLista.length,
        itemBuilder: (context, indice) {
          PersonalElement persona = this.miLista[indice];
          return ListTile(
            title: Text(
              '${miLista[indice].apellido1} ${miLista[indice].nombre1} ${miLista[indice].nombre2}',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              '${miLista[indice].grado.grado}',
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            leading: FadeInImage(
                width: 100,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(miLista[indice].fotoUrl)),
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: persona);
            },
            trailing: Icon(Icons.arrow_forward),
          );
        });
  }
}
