import 'package:flutter/material.dart';
import 'package:legajos_app/models/personal_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PersonalElement personal =
        ModalRoute.of(context)!.settings.arguments as PersonalElement;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
              '${personal.apellido1} ${personal.apellido2 ?? ''} ${personal.nombre1} ${personal.nombre2 ?? ''}'),
          SliverList(
              delegate: SliverChildListDelegate([_PosterYData(personal)]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String nombre;

  _CustomAppBar(this.nombre) {}

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 80,
        floating: false,
        pinned: true,
        title: Text(
          this.nombre,
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}

class _PosterYData extends StatelessWidget {
  final PersonalElement _persona;

  const _PosterYData(this._persona);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                width: 150.0,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(this._persona.fotoUrl)),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: [Text('Grado: ${this._persona.grado.grado}')],
          )
        ],
      ),
    );
  }
}
