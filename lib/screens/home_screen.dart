import 'package:flutter/material.dart';
import 'package:legajos_app/models/personal_response.dart';
import 'package:legajos_app/providers/personal_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_off_outlined))
          ],
          title: const Center(
            child: Text('Aplicación de Personal'),
          ),
        ),
        body: _CrearLista());
  }
}

class _CrearLista extends StatefulWidget {
  _CrearLista({Key? key}) : super(key: key);

  @override
  __CrearListaState createState() => __CrearListaState();
}

class __CrearListaState extends State<_CrearLista> {
  @override
  Widget build(BuildContext context) {
    final personalProvider = Provider.of<PersonalProvider>(context);
    List<PersonalElement> listadoDePersonal = personalProvider.personal_list;
    return _lista(listadoDePersonal);
  }

  Widget _lista(List<PersonalElement> lista) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          PersonalElement persona = lista[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details', arguments: persona);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                          fit: BoxFit.fill,
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(persona.fotoUrl))),
                ),
                Text(
                  '${persona.apellido1} ${persona.nombre1}',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Text(
                  '${persona.grado.grado}',
                  style: Theme.of(context).primaryTextTheme.caption,
                )
              ],
            ),
          );
        });
  }
}
