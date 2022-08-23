import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/screens/home/widgets/pokemon_card_widget.dart';
import 'package:flutter/material.dart';

class PokemonsList extends StatelessWidget {
  const PokemonsList({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final List<Pokedex> pokemon;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(
          'Pokedex',
          style: Theme.of(context).textTheme.headline1,
        ),
        expandedHeight: 300,
        collapsedHeight: 70,
        pinned: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            DecoratedBox(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
              child: Column(
                children: [
                  ...pokemon
                      .map((pokemonU) => PokemonCard(pokemon: pokemonU))
                      .toList()
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
