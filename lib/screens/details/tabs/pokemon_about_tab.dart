import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter/material.dart';

class PokemonAboutTab extends StatelessWidget {
  const PokemonAboutTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                Text(
                  'Pokédex Data',
                  style: TextStyle(
                    color: pokemon.baseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Height',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Weight',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Abilities',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Weaknesses',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        pokemon.height.toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(116, 116, 118, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        pokemon.weight.toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(116, 116, 118, 1),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...pokemon.abilities
                            .map((ability) => pokemonAbilitys(ability))
                            .toList()
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget pokemonAbilitys(Ability ability) {
  final bool hidden = ability.isHidden;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      '${ability.ability.name}, ${hidden ? '(Ability is hidden)' : ''}',
      style: const TextStyle(
        color: Color.fromRGBO(116, 116, 118, 1),
      ),
    ),
  );
}
