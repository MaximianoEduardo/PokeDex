import 'package:app_pokedex/screens/details/pokemon.dart';
import 'package:app_pokedex/screens/home/pokedex.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  const Routes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (BuildContext context) {
            return const Pokedex();
          });
        }
        if (settings.name == PokemonArguments.routeName) {
          final args = settings.arguments as ScreenArguments;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return PokemonArguments(
                pokemon: args.pokemon,
              );
            },
          );
        }

        return null;
      },
    );
  }
}
