import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Details Screen'),
        ),
      ),
      body: Center(
        child: Text('Details Screen'),
      ),
    );
  }
}
