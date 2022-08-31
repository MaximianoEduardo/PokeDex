// import 'package:app_pokedex/data/repository.dart';
// import 'package:app_pokedex/models/pokemon_evolution.dart';
// import 'package:app_pokedex/screens/details/widgets/pokemon_evolution.dart';
// import 'package:flutter/material.dart';
// import '../../../models/pokemon_specie.dart';
// import '../../../models/pokemon_info.dart';

// class PokemonEvolutionTab extends StatelessWidget {
//   const PokemonEvolutionTab({
//     Key? key,
//     required this.pokemon,
//     required this.specie,
//     required this.repository,
//   }) : super(key: key);

//   final PokemonRepository repository;
//   final Pokedex pokemon;
//   final PokemonSpecie specie;

//   @override
//   Widget build(BuildContext context) {
//     final String pokemonChainID = specie.evolutionChain.url.split('/')[6];

//     return FutureBuilder<PokemonEvolution>(
//         future: repository.getPokemonEvolution(pokemonChainID),
//         builder: ((BuildContext context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return PokemonEvolutionWidget(
//               evolution: snapshot.data!,
//               species: specie,
//               pokemon: pokemon,
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Text('Carregando'),
//             );
//           }

//           return const Text('caiu aqui');
//         }));
//   }
// }
