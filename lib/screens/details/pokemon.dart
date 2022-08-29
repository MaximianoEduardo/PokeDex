import 'package:app_pokedex/bloc/pokemon_specie_bloc.dart';
import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:app_pokedex/screens/details/tabs/pokemon_about_tab.dart';
import 'package:app_pokedex/screens/details/tabs/pokemon_stats_tab.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_evolution.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/pokemon_default_widget.dart';

class PokemonArguments extends StatefulWidget {
  static const routeName = '/details';

  final Pokedex pokemon;
  final PokemonRepository repository;

  const PokemonArguments({
    super.key,
    required this.pokemon,
    required this.repository,
  });

  @override
  State<PokemonArguments> createState() => _PokemonArgumentsState();
}

class _PokemonArgumentsState extends State<PokemonArguments> {
  @override
  Widget build(BuildContext context) {
    final cubitSpecie = context.watch<PokemonSpecieBloc>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                backgroundColor: widget.pokemon.baseColor,
                expandedHeight: 300,
                collapsedHeight: 300,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.pokemon.sprites.other
                                .officialArtwork.frontDefault,
                            width: 125,
                            height: 125,
                          ),
                          PokemonDefaultWidget(
                            pokemon: widget.pokemon,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                bottom: TabBar(
                    indicatorColor: widget.pokemon.baseColor,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    splashBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    tabs: [
                      Tab(
                        text: capitalize('About'),
                      ),
                      Tab(
                        text: capitalize('Stats'),
                      ),
                      Tab(
                        text: capitalize('Evolution'),
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(
            children: [
              consumerAbout(cubitSpecie, widget.pokemon),
              PokemonStatsTab(pokemon: widget.pokemon),
              consumerEvolution(cubitSpecie, widget.pokemon)
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final Pokedex pokemon;

  ScreenArguments(this.pokemon);
}

Widget getLoadingSpeciesDetails(PokemonSpecieBloc cubit, Pokedex pokemon) {
  cubit.getPokemonSpecie(pokemon.id.toString());
  return const Text('Loading');
}

Widget getPokemonAboutTab(PokemonSpecie pokemonSpecie, Pokedex pokemon) {
  final pokemonSpecie_ = pokemonSpecie;

  return PokemonAboutTab(
    pokemon: pokemon,
    pokemonSpecie: pokemonSpecie_,
  );
}

Widget consumerAbout(PokemonSpecieBloc cubitSpecie, Pokedex pokemon) {
  return BlocConsumer<PokemonSpecieBloc, PokemonSpecieState>(
    bloc: cubitSpecie,
    listener: (context, state) {
      if (state is EmptyPokemonSpecieDetails) {
        cubitSpecie.getPokemonSpecie(pokemon.id.toString());
      }
    },
    builder: (context, state) {
      return state is EmptyPokemonSpecieDetails
          ? getLoadingSpeciesDetails(cubitSpecie, pokemon)
          : state is PokemonSpecieDetails
              ? getPokemonAboutTab(
                  state.pokemonSpecie,
                  pokemon,
                )
              : state is LoadingPokemonSpecieDetails
                  ? getLoadingSpeciesDetails(cubitSpecie, pokemon)
                  : const Text('data');
    },
  );
}

Widget consumerEvolution(PokemonSpecieBloc cubitSpecie, Pokedex pokemon) {
  return BlocConsumer<PokemonSpecieBloc, PokemonSpecieState>(
    bloc: cubitSpecie,
    listener: (context, state) {},
    builder: (context, state) {
      return state is EmptyPokemonSpecieDetails
          ? getLoadingSpeciesDetails(cubitSpecie, pokemon)
          : state is PokemonSpecieDetails
              ? getPokemonEvolutionTab(
                  state.pokemonEvolution,
                  state.pokemonSpecie,
                  pokemon,
                )
              : const Text('data');
    },
  );
}

Widget getPokemonEvolutionTab(
  PokemonEvolution pokemonEvolution,
  PokemonSpecie species,
  Pokedex pokemon,
) {
  return PokemonEvolutionWidget(
    evolution: pokemonEvolution,
    species: species,
    pokemon: pokemon,
  );
}
