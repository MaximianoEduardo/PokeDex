import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/pokedex_bloc.dart';
import 'pokemon_card_widget.dart';

class BodyPokedex extends StatelessWidget {
  const BodyPokedex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokedexBloc>();

    return BlocConsumer(
      bloc: cubit,
      listener: (context, state) {
        if (state is ChangingGeneration) {
          final generationName = state.namegeneration;
          switch (generationName) {
            case Generation.generationI:
              cubit.listPokemons(1, 151, generationName);
              break;
            case Generation.generationII:
              cubit.listPokemons(152, 251, generationName);
              break;
            case Generation.generationIII:
              cubit.listPokemons(252, 386, generationName);
              break;
            case Generation.generationIV:
              cubit.listPokemons(387, 493, generationName);
              break;
            case Generation.generationV:
              cubit.listPokemons(494, 649, generationName);
              break;
            case Generation.generationVI:
              cubit.listPokemons(650, 721, generationName);
              break;
            case Generation.generationVII:
              cubit.listPokemons(722, 809, generationName);
              break;
            case Generation.generationVIII:
              cubit.listPokemons(810, 905, generationName);
              break;
            default:
              cubit.listPokemons(1, 151, generationName);
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingPokemons) {
          getLoadingWidget();
        } else if (state is Error) {
          getErrorWidget('error');
        } else if (state is EmptyPokedex) {
          getPokedexEmptyWidget(context, Generation.generationI);
        } else if (state is PokemonList) {
          final pokemon = state.pokemon;
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ...pokemon
                    .map((pokemonU) => PokemonCard(pokemon: pokemonU))
                    .toList()
              ],
            ),
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

Widget getPokedexEmptyWidget(BuildContext context, Generation generation) {
  final cubit = context.watch<PokedexBloc>();

  switch (generation) {
    case Generation.generationI:
      cubit.listPokemons(1, 151, generation);
      break;
    case Generation.generationII:
      cubit.listPokemons(152, 251, generation);
      break;
    case Generation.generationIII:
      cubit.listPokemons(387, 493, generation);
      break;
    case Generation.generationIV:
      cubit.listPokemons(494, 649, generation);
      break;
    default:
      cubit.listPokemons(1, 151, generation);
  }
  //| 252-386 | 387-493 | 494-649 | 650-721 | 722-809 | 810-905

  return const Text('vazio');
}


// BlocBuilder(
//       bloc: cubit,
//       builder: (context, state) {
//         if (state is LoadingPokemons) {
//           getLoadingWidget();
//         } else if (state is Error) {
//           getErrorWidget('error');
//         } else if (state is EmptyPokedex) {
//           getPokedexEmptyWidget(context, Generation.generationI);
//         } else if (state is PokemonList) {
//           final pokemon = state.pokemon;
//           return DecoratedBox(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 ...pokemon
//                     .map((pokemonU) => PokemonCard(pokemon: pokemonU))
//                     .toList()
//               ],
//             ),
//           );
//         }
//         return Container();
//       },
//     );