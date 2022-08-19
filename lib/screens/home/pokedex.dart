import 'package:app_pokedex/screens/home/pokemons_list.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import '../../bloc/pokedex_bloc.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({
    Key? key,
  }) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexBloc, PokedexState>(
      builder: (context, state) {
        if (state is LoadingPokemons) {
          getLoadingWidget();
        } else if (state is Error) {
          getErrorWidget('error');
        } else if (state is EmptyPokedex) {
          getPokedexEmptyWidget(context);
        } else if (state is AllPokemons) {
          final pokemon = state.pokemon;
          return PokemonsList(
            pokemon: pokemon,
          );
        }
        return Container();
      },
    );
  }
}

Widget getLoadingWidget() {
  return const Center(
    child: Text('Carregando'),
  );
}

Widget getErrorWidget(error) {
  return Center(
    child: Text(error),
  );
}

Widget getPokedexEmptyWidget(BuildContext context) {
  final cubit = context.watch<PokedexBloc>();

  cubit.listPokemons();

  return const Text('vazio');
}
