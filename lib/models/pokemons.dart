import 'dart:convert';

Pokemons pokemonsFromMap(String str) => Pokemons.fromMap(json.decode(str));

String pokemonsToMap(Pokemons data) => json.encode(data.toMap());

class Pokemons {
  Pokemons({
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        pokemons:
            List<Pokemon>.from(json["pokemons"].map((x) => Pokemon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pokemons": List<dynamic>.from(pokemons.map((x) => x.toMap())),
      };
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
    required this.num,
  });

  final String name;
  final String url;
  final String num;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
        num: json["url"].split('/')[6].toString(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };

  /// A getter function that returns the image url of the pokemon.
  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$num.png';
}
