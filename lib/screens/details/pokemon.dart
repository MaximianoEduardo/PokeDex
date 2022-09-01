import 'package:app_pokedex/bloc/pokemon_specie_bloc.dart';
import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:app_pokedex/screens/details/tabs/pokemon_about_tab.dart';
import 'package:app_pokedex/screens/details/tabs/pokemon_stats_tab.dart';
import 'package:app_pokedex/screens/details/widgets/pokemon_evolution.dart';
import 'package:app_pokedex/screens/home/widgets/body_pokedex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _PokemonArgumentsState extends State<PokemonArguments>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  int _previuosIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: list.length,
      vsync: this,
      initialIndex: 0,
    );
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        _previuosIndex = _controller.previousIndex;
      });
    });
  }

  List<Widget> list = [
    Tab(
      text: capitalize('About'),
    ),
    Tab(
      text: capitalize('Stats'),
    ),
    Tab(
      text: capitalize('Evolution'),
    ),
  ];

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
                  tabs: list,
                  controller: _controller,
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              consumerAbout(
                  cubitSpecie, widget.pokemon, _selectedIndex, _previuosIndex),
              PokemonStatsTab(pokemon: widget.pokemon),
              consumerEvolution(
                  cubitSpecie, widget.pokemon, _selectedIndex, _previuosIndex)
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

Widget getPokemonAboutTab(
  PokemonSpecie pokemonSpecie,
  Pokedex pokemon,
) {
  final pokemonSpecie_ = pokemonSpecie;

  return PokemonAboutTab(
    pokemon: pokemon,
    pokemonSpecie: pokemonSpecie_,
  );
}

Widget consumerAbout(
    PokemonSpecieBloc cubit, Pokedex pokemon, int index, int previousIndex) {
  return BlocConsumer(
      bloc: cubit,
      builder: (context, state) {
        return state is PokemonSpecieDetails
            ? getPokemonAboutTab(
                state.pokemonSpecie,
                pokemon,
              )
            : state is LoadingPokemonSpecieDetails
                ? getLoadingSpeciesDetails(cubit, pokemon)
                : state is EmptyPokemonSpecieDetails
                    ? getLoadingSpeciesDetails(cubit, pokemon)
                    : state is PokemonEvolutionDetails
                        ? setStateBack(cubit, pokemon)
                        : Text('data, ${cubit.state}');
      },
      listener: (context, state) {});
}

Widget setStateBack(PokemonSpecieBloc cubit, Pokedex pokemon) {
  cubit.getPokemonSpecie(pokemon.id.toString());
  return const Text('data');
}

Widget consumerEvolution(PokemonSpecieBloc cubitSpecie, Pokedex pokemon,
    int index, int previousIndex) {
  return BlocConsumer<PokemonSpecieBloc, PokemonSpecieState>(
    bloc: cubitSpecie,
    listener: (context, state) {
      if (state is EmptyPokemonSpecieDetails) {
        cubitSpecie.getPokemonSpecie(pokemon.id.toString());
      }
    },
    builder: (context, state) {
      return state is PokemonSpecieDetails
          ? getPokemonEvolutionTab(
              cubitSpecie,
              state.pokemonSpecie.evolutionChain.url.split('/')[6],
            )
          : state is PokemonEvolutionDetails
              ? PokemonEvolutionWidget(
                  evolution: state.pokemonEvolution, pokemon: pokemon)
              : state is LoadingPokemonSpecieDetails
                  ? const Text('Carregando')
                  : Text('data, ${cubitSpecie.state}');
    },
  );
}

Widget getPokemonEvolutionTab(PokemonSpecieBloc cubit, String pokemonChainId) {
  cubit.getPokemonEvolution(pokemonChainId);
  return const Text('data');
}

Widget getPokemonEvolutionTabs(
    PokemonSpecieBloc cubit, Pokedex pokemon, String pokemonChainID) {
  return Row();
}
