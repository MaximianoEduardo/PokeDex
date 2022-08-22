import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:flutter/material.dart';

import '../../../models/pokemon_info.dart';

class PokemonBreeding extends StatelessWidget {
  const PokemonBreeding({
    Key? key,
    required this.pokemon,
    required this.species,
  }) : super(key: key);

  final Pokedex pokemon;
  final PokemonSpecie species;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              Text(
                'Breeding',
                style: TextStyle(
                  color: pokemon.baseColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Gender',
                      style: TextStyle(
                        color: Color.fromRGBO(116, 116, 118, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Egg Groups',
                      style: TextStyle(
                        color: Color.fromRGBO(116, 116, 118, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
