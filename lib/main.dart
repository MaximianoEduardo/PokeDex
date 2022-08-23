import 'package:app_pokedex/bloc/pokedex_bloc.dart';
import 'package:app_pokedex/bloc/pokemon_bloc.dart';
import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'sf-pro',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            color: Color.fromRGBO(23, 23, 27, 0.6),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokedexBloc(PokemonRepository()),
          ),
          BlocProvider(
            create: (context) => PokemonBloc(PokemonRepository()),
          ),
        ],
        child: const Routes(),
      ),
    );
  }
}
