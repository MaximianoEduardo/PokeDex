import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../common/capitalize.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    Key? key,
    required this.status,
    required this.baseColor,
  }) : super(key: key);

  final Stat status;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              capitalize(status.stat.name),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            status.baseStat.toString(),
            style: const TextStyle(color: Color.fromRGBO(116, 116, 116, 1)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: SizedBox(
              width: 150,
              child: LinearPercentIndicator(
                animation: false,
                lineHeight: 4,
                percent:
                    status.baseStat > 100 ? 100 / 100 : (status.baseStat) / 100,
                progressColor: baseColor,
                //backgroundColor: Colors.white.withOpacity(0.3),
                barRadius: const Radius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
