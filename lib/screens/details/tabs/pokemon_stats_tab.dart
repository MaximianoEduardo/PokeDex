import 'package:flutter/material.dart';

import '../../../models/pokemon_info.dart';
import '../widgets/pokemon_status_widget.dart';

class PokemonStatsTab extends StatelessWidget {
  const PokemonStatsTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: ListView(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Text(
                    'Base Stats',
                    style: TextStyle(
                      color: pokemon.baseColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ...pokemon.stats
                    .map((status) => PokemonStats(
                          baseColor: pokemon.baseColor,
                          status: status,
                        ))
                    .toList()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Type Defenses',
                        style: TextStyle(
                          color: pokemon.baseColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            'The effectiveness of each type on ${pokemon.name}.'),
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
