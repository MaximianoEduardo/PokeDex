import 'package:flutter/material.dart';
import '../bloc/pokedex_bloc.dart';
import 'package:app_pokedex/screens/home/widgets/generations/generationcard_widget.dart';

class ModalBottomGenerations extends StatefulWidget {
  const ModalBottomGenerations({
    Key? key,
    required this.generation,
  }) : super(key: key);

  final Generation generation;

  @override
  State<ModalBottomGenerations> createState() => _ModalBottomGenerationsState();
}

class _ModalBottomGenerationsState extends State<ModalBottomGenerations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Generations',
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Use search for generations to explore your Pokémon!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          GenerationsCards(
            generation: widget.generation,
          )
        ],
      ),
    );
  }
}
