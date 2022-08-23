import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     CachedNetworkImage(
              //       imageUrl:
              //           pokemon.sprites.other.officialArtwork.frontDefault,
              //       width: 75,
              //       height: 75,
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     Text('#${evolution.id.toString()}'),
              //     Text(
              //       capitalize(
              //         evolution.chain.species.name,
              //       ),
              //     ),
              //   ],
              // ),
              ...minLevel(evolution.chain.evolutionDetails),
            ],
          ),
        ),
      ],
    );
  }
}

List<Text> minLevel(List<EvolutionDetail> chain) {
  return chain.map((e) => Text(e.trigger.name)).toList();
}
