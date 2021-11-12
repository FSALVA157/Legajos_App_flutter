import 'package:flutter/material.dart';
import 'package:legajos_app/providers/personal_provider.dart';
import 'package:legajos_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          appBarTheme: AppBarTheme(color: Colors.green),
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              caption: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ))),
      title: 'App de Personal',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PersonalProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}
