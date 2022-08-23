import 'package:flutter/material.dart';

import '../../../models/pokemon_info.dart';

class PokemonLocation extends StatelessWidget {
  const PokemonLocation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              Text(
                'Location',
                style: TextStyle(
                  color: pokemon.baseColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
