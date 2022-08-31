import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:app_pokedex/screens/details/widgets/evolution_logic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/pokemon_info.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    Key? key,
    required this.evolution,
    //required this.species,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;
  final PokemonEvolution evolution;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: 500,
            child: GridView.count(
              mainAxisSpacing: 30,
              crossAxisCount: 3,
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
                        Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: pokemon
                                  .sprites.other.officialArtwork.frontDefault,
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '#${evolution.id.toString()}',
                                style: const TextStyle(
                                    color: Color.fromRGBO(116, 116, 118, 1),
                                    fontSize: 12),
                              ),
                            ),
                            Text(
                              capitalize(evolution.chain.species.name),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                EvolutionFirstLogic(
                  evolution: evolution.chain.evolvesTo,
                ),
                EvolutionSecondLogic(
                  secondEvolution: evolution.chain.evolvesTo,
                ),
                EvolutionThirdLogic(
                  secondEvolution: evolution.chain.evolvesTo,
                ),
                EvolutionFourLogic(secondEvolution: evolution.chain.evolvesTo),
                EvolutionFiveLogic(secondEvolution: evolution.chain.evolvesTo)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
