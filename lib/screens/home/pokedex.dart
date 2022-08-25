import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pokedex_bloc.dart';
import '../../widgets/modal_bottom_generations.dart';
import 'widgets/body_pokedex.dart';
import 'widgets/header_pokedex.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({
    Key? key,
  }) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final Generation generation = Generation.generationI;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokedexBloc>();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 300,
          collapsedHeight: 70,
          pinned: false,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return BlocConsumer(
                            bloc: cubit,
                            listener: (context, state) {},
                            builder: (context, state) {
                              return FractionallySizedBox(
                                heightFactor: 0.7,
                                child: state is PokemonList
                                    ? ModalBottomGenerations(
                                        generation: state.generation,
                                      )
                                    : const ModalBottomGenerations(
                                        generation: Generation.generationI,
                                      ),
                              );
                            },
                          );
                        });
                  },
                  child: const Icon(
                    Icons.grid_3x3,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
                const Icon(
                  Icons.sort_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: HeaderPokedex(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const BodyPokedex(),
            ],
          ),
        )
      ]),
    );
  }
}
