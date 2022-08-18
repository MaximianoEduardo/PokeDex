import 'package:app_pokedex/screens/home/pokedex.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

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
        return null;
      },
    );
  }
}
