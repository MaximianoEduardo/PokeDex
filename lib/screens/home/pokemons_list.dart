import 'package:app_pokedex/bloc/pokedex_bloc.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/screens/home/widgets/pokemon_card_widget.dart';
import 'package:app_pokedex/widgets/modal_bottom_generations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final List<Pokedex> pokemon;

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  late TextEditingController _inputController;

  @override
  void initState() {
    _inputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const ModalBottomGenerations();
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
            child: SizedBox(
              height: 200,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pokedex',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 30.0,
                        ),
                        child: Text(
                          'Search for Pokémon by name or using the National Pokédex number.',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _inputController,
                      onSubmitted: (value) {},
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'What Pokémon are you looking for?',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(116, 116, 118, 1),
                        ),
                        focusColor: Color.fromRGBO(116, 116, 118, 1),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20.0,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        prefixIconColor: Color.fromRGBO(116, 116, 118, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            BlocListener<PokedexBloc, PokedexState>(
              listener: (context, state) {
                // TODO: implement listener
                // if (state is SearchingPokemon) {
                //   const Center(
                //     child: Text('Carregando'),
                //   );
                // }
              },
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1)),
                child: Column(
                  children: [
                    ...widget.pokemon
                        .map((pokemonU) => PokemonCard(pokemon: pokemonU))
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
