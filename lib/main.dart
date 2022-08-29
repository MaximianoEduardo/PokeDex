import 'package:app_pokedex/bloc/pokedex_bloc.dart';
import 'package:app_pokedex/bloc/pokemon_specie_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokedexBloc>(
          create: (context) => PokedexBloc(PokemonRepository()),
        ),
        BlocProvider<PokemonSpecieBloc>(
          create: (context) => PokemonSpecieBloc(PokemonRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //
          //primarySwatch: Colors.,
          fontFamily: 'sf-pro',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline3: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
        home: const Routes(),
      ),
    );
  }
}
