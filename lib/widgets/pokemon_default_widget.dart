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
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                capitalize(pokemon.name),
                style: Theme.of(context).textTheme.headline2,
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
