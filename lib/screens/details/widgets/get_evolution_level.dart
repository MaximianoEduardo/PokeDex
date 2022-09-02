import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:flutter/material.dart';

class GetLevelUP extends StatelessWidget {
  const GetLevelUP({
    Key? key,
    required this.evolutionDetails,
  }) : super(key: key);

  final List<EvolutionDetail> evolutionDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.arrow_forward,
          color: Color.fromRGBO(116, 116, 118, 1),
          size: 25,
        ),
        ...evolutionDetails
            .map(
              (e) => checkLevel(e.minLevel, e.item),
            )
            .toList(),
      ],
    );
  }
}

Widget checkLevel(dynamic minLevel, Species item) {
  final String itemToUP = item.name;
  final String checkMin = minLevel != null
      ? ' Level ${minLevel.toString()}'
      : ' Use-item - $itemToUP ';

  return (Text('($checkMin)'));
}
