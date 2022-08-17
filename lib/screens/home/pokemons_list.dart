import 'package:app_pokedex/models/pokemon_info.dart';
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
        title: Text('Pokedex'),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            // To convert this infinite list to a list with three items,
            // uncomment the following line:
            // if (index > 3) return null;
            return Column(
              children: pokemon.map((pokemon) => Text(pokemon.name)).toList(),
            );
          },
          // Or, uncomment the following line:
          childCount: pokemon.length,
        ),
      )
    ]);
  }
}

// Row(
//               children: pokemon.map((pokemon) => Text(pokemon.name)).toList(),
//             );