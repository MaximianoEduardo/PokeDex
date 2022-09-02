import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/screens/details/widgets/get_evolution_level.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';

class EvolutionFirstLogic extends StatelessWidget {
  final List<Chain> evolution;

  const EvolutionFirstLogic({
    Key? key,
    required this.evolution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...evolution
            .map((e) => GetLevelUP(evolutionDetails: e.evolutionDetails))
      ],
    );
  }
}

class EvolutionSecondLogic extends StatelessWidget {
  final List<Chain> secondEvolution;

  const EvolutionSecondLogic({
    super.key,
    required this.secondEvolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...secondEvolution.map((e) => getSecondEvolutionWidget(
            e.evolvesTo, e.species.name, e.species.url.split('/')[6]))
      ],
    );
  }
}

Widget getSecondEvolutionWidget(
    List<Chain> evolvesTo, String pokemonName, pokemonID) {
  return Column(
    children: [
      CachedNetworkImage(
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonID.toString()}.png',
        width: 60,
        height: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          '#${pokemonID.toString()}',
          style: const TextStyle(
              color: Color.fromRGBO(116, 116, 118, 1), fontSize: 12),
        ),
      ),
      Text(
        capitalize(pokemonName),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

class EvolutionThirdLogic extends StatelessWidget {
  const EvolutionThirdLogic({
    Key? key,
    required this.secondEvolution,
  }) : super(key: key);

  final List<Chain> secondEvolution;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...secondEvolution.map((e) => getSecondEvolutionWidget(
            e.evolvesTo, e.species.name, e.species.url.split('/')[6])),
      ],
    );
  }
}

class EvolutionFourLogic extends StatelessWidget {
  const EvolutionFourLogic({
    Key? key,
    required this.secondEvolution,
  }) : super(key: key);

  final List<Chain> secondEvolution;

  @override
  Widget build(BuildContext context) {
    final Chain getLevelUpFirst = secondEvolution.first;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetLevelUP(evolutionDetails: getLevelUpFirst.evolutionDetails)
      ],
    );
  }
}

class EvolutionFiveLogic extends StatelessWidget {
  const EvolutionFiveLogic({
    Key? key,
    required this.secondEvolution,
  }) : super(key: key);

  final List<Chain> secondEvolution;

  @override
  Widget build(BuildContext context) {
    final Chain lastEvolution = secondEvolution.first;

    return Column(
      children: [
        getSecondEvolutionWidgetLastEvolution(lastEvolution.evolvesTo)
      ],
    );
  }
}

Widget getSecondEvolutionWidgetLastEvolution(List<Chain> e) {
  final Chain lastEvolution = e[0];

  if (e.isNotEmpty) {
    getLastEvolution(lastEvolution);
  }

  return Container();
}

Widget getLastEvolution(Chain e) {
  return Column(
    children: [
      CachedNetworkImage(
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${e.species.url.split('/')[6].toString()}.png',
        width: 60,
        height: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          '#${e.species.url.split('/')[6].toString()}',
          style: const TextStyle(
              color: Color.fromRGBO(116, 116, 118, 1), fontSize: 12),
        ),
      ),
      Text(
        capitalize(e.species.name),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}
