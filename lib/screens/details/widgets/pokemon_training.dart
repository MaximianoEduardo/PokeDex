import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:flutter/material.dart';

import '../../../models/pokemon_info.dart';

class PokemonTraining extends StatelessWidget {
  const PokemonTraining({
    Key? key,
    required this.pokemon,
    required this.specie,
  }) : super(key: key);

  final Pokedex pokemon;
  final PokemonSpecie specie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Text(
                'Training',
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
                  child: Text('Catch Rate',
                      style: TextStyle(
                        color: Color.fromRGBO(116, 116, 118, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Base Happiness',
                      style: TextStyle(
                        color: Color.fromRGBO(116, 116, 118, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Grow Rate',
                      style: TextStyle(
                        color: Color.fromRGBO(116, 116, 118, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      specie.captureRate.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(116, 116, 118, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0),
                    child: Text(
                      specie.baseHappiness.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(116, 116, 118, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(specie.growthRate.name),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
