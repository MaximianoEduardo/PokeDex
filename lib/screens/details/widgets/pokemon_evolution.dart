import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/pokemon_info.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    Key? key,
    required this.evolution,
    required this.species,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;
  final PokemonEvolution evolution;
  final PokemonSpecie species;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: SvgPicture.asset(
                          'assets/patterns/pokeball.svg',
                          width: 100,
                          height: 100,
                          color: const Color.fromRGBO(245, 245, 245, 0.4),
                        ),
                      ),
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: pokemon
                                .sprites.other.officialArtwork.frontDefault,
                            width: 75,
                            height: 75,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('#${evolution.id.toString()}'),
                    ],
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     ...evolution.chain.evolvesTo
              //         .map((e) => getEvolutionDetails(e))
              //         .toList(),
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}

// Widget getEvolutionDetails(Chain evolvesto) {
//   return (Text(evolvesto.evolvesTo
//   ));
// }
