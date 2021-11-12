import 'package:flutter/material.dart';

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
  var _listaNumeros = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return _lista();
  }

  Widget _lista() {
    return ListView.builder(
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                        placeholder: AssetImage('assets/loading.gif'),
                        image: NetworkImage(
                            'https://via.placeholder.com/200x200')),
                  ),
                ),
                Text('Nombre del Personal')
              ],
            ),
          );
        });
  }
}
