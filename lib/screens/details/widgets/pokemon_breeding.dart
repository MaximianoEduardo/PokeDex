import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Egg Groups',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircularPercentIndicator(
                          radius: 10,
                          lineWidth: 5.0,
                          percent: species.genderRate == -1
                              ? 0
                              : species.genderRate / 8,
                          progressColor: pokemon.baseColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '${((species.genderRate / 8) * 100).toString()}% to be female',
                          style: const TextStyle(
                            color: Color.fromRGBO(116, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ...species.eggGroups
                          .map((eggs) => pokemonEggs(eggs))
                          .toList()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget pokemonEggs(NameUrl eggs) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      '${eggs.name},',
      style: const TextStyle(
        color: Color.fromRGBO(116, 116, 118, 1),
      ),
    ),
  );
}
