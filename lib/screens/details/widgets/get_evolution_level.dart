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
              (e) => checkLevel(e.minLevel, e.item, e.trigger),
            )
            .toList(),
      ],
    );
  }
}

Widget checkLevel(dynamic minLevel, dynamic item, Species trigger) {
  final String checkMin;

  if (item != null) {
    checkMin = ' Use-item';
  } else if (minLevel != null) {
    checkMin = ' Level ${minLevel.toString()}';
  } else {
    checkMin = ' ${trigger.name} ';
  }

  return (Text('($checkMin)'));
}
