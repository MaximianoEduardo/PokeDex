import 'package:flutter/material.dart';

import '../common/capitalize.dart';
import '../models/pokemon_info.dart';
import '../screens/home/widgets/pokemon_type_widget.dart';

class PokemonDefaultWidget extends StatelessWidget {
  const PokemonDefaultWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '#${pokemon.id.toString()}',
              style: const TextStyle(
                color: Color.fromRGBO(23, 23, 27, 0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                capitalize(pokemon.name),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        PokemonType(
          types: pokemon.types,
        )
      ],
    );
  }
}
