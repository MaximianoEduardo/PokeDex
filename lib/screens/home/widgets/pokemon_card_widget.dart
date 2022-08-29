import 'package:app_pokedex/bloc/pokemon_specie_bloc.dart';
import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/screens/details/pokemon.dart';
import 'package:app_pokedex/screens/home/widgets/card_skeleton_widget.dart';
import 'package:app_pokedex/screens/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;

    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _isLoading = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
          onTap: () {
            BlocProvider<PokemonSpecieBloc>(
                create: (context) => PokemonSpecieBloc(PokemonRepository()));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (routeContext) => PokemonArguments(
                  pokemon: widget.pokemon,
                  repository: PokemonRepository(),
                ),
              ),
            );
          },
          child: _isLoading
              ? const CardSkeleton()
              : CardWidget(pokemon: widget.pokemon)),
    );
  }
}
