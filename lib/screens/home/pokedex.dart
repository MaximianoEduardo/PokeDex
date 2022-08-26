import 'package:app_pokedex/widgets/modal_bottom_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  child: SvgPicture.asset(
                    'assets/icons/generation.svg',
                    width: 25,
                    height: 25,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
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
                                return state is PokemonList
                                    ? FractionallySizedBox(
                                        heightFactor: 0.5,
                                        child: ModalBottomSort(
                                          generation: state.generation,
                                          sort: state.sort,
                                        ),
                                      )
                                    : const FractionallySizedBox(
                                        heightFactor: 0.5,
                                        child: ModalBottomSort(
                                          generation: Generation.generationI,
                                          sort: SortPokemons.smallestID,
                                        ),
                                      );
                              },
                            );
                          });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/sort.svg',
                      width: 25,
                      height: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 25,
                      height: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
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
