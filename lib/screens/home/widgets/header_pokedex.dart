import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/pokedex_bloc.dart';

class HeaderPokedex extends StatefulWidget {
  const HeaderPokedex({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderPokedex> createState() => _HeaderPokedexState();
}

class _HeaderPokedexState extends State<HeaderPokedex> {
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
    final cubit = context.watch<PokedexBloc>();

    return Padding(
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
                onSubmitted: (value) {
                  cubit.searchPokemon(value.toString());
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    cubit.listPokemons(
                      1,
                      151,
                      Generation.generationI,
                      SortPokemons.smallestID,
                    );
                  }
                },
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
    );
  }
}
