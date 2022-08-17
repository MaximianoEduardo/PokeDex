import 'package:app_pokedex/screens/home/pokemons_list.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import '../../bloc/pokedex_bloc.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokedexBloc>();

    return BlocListener(
      listener: (context, state) {
        if (state is AllPokemons) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonsList(
                pokemon: state.pokemon,
              ),
            ),
          );
        }
      },
      bloc: cubit,
      child: cubit.state is LoadingPokemons
          ? getLoadingWidget()
          : cubit.state is Error
              ? getErrorWidget("Some Error")
              : cubit.state is EmptyPokedex
                  ? getPokedexEmptyWidget(context)
                  : const Text('Void'),
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

  cubit.getPokemons();

  return const Text('vazio');
}
