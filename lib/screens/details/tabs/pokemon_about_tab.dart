import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_breeding.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_data.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_location.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_training.dart';
import 'package:flutter/material.dart';

class PokemonAboutTab extends StatelessWidget {
  const PokemonAboutTab({
    Key? key,
    required this.pokemon,
    required this.pokemonSpecie,
  }) : super(key: key);

  final Pokedex pokemon;
  final PokemonSpecie pokemonSpecie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          PokemonData(
            pokemon: pokemon,
          ),
          PokemonTraining(
            pokemon: pokemon,
            specie: pokemonSpecie,
          ),
          PokemonBreeding(
            pokemon: pokemon,
            species: pokemonSpecie,
          ),
          PokemonLocation(
            pokemon: pokemon,
          ),
        ],
      ),
    );
  }
}
