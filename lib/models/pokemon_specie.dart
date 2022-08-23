// To parse this JSON data, do
//
//     final pokemonSpecie = pokemonSpecieFromMap(jsonString);

import 'dart:convert';

PokemonSpecie pokemonSpecieFromMap(String str) =>
    PokemonSpecie.fromMap(json.decode(str));

String pokemonSpecieToMap(PokemonSpecie data) => json.encode(data.toMap());

class PokemonSpecie {
  PokemonSpecie({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  final int baseHappiness;
  final int captureRate;
  final NameUrl color;
  final List<NameUrl> eggGroups;
  final EvolutionChain evolutionChain;
  final dynamic evolvesFromSpecies;
  final List<dynamic> flavorTextEntries;
  final List<dynamic> formDescriptions;
  final bool formsSwitchable;
  final int genderRate;
  final List<dynamic> genera;
  final NameUrl generation;
  final NameUrl growthRate;
  final NameUrl habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<dynamic> names;
  final int order;
  final List<dynamic> palParkEncounters;
  final List<dynamic> pokedexNumbers;
  final NameUrl shape;
  final List<dynamic> varieties;

  factory PokemonSpecie.fromMap(Map<String, dynamic> json) => PokemonSpecie(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: NameUrl.fromMap(json["color"]),
        eggGroups: List<NameUrl>.from(
            json["egg_groups"].map((x) => NameUrl.fromMap(x))),
        evolutionChain: EvolutionChain.fromMap(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries:
            List<dynamic>.from(json["flavor_text_entries"].map((x) => x)),
        formDescriptions:
            List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<dynamic>.from(json["genera"].map((x) => x)),
        generation: NameUrl.fromMap(json["generation"]),
        growthRate: NameUrl.fromMap(json["growth_rate"]),
        habitat: NameUrl.fromMap(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<dynamic>.from(json["names"].map((x) => x)),
        order: json["order"],
        palParkEncounters:
            List<dynamic>.from(json["pal_park_encounters"].map((x) => x)),
        pokedexNumbers:
            List<dynamic>.from(json["pokedex_numbers"].map((x) => x)),
        shape: NameUrl.fromMap(json["shape"]),
        varieties: List<dynamic>.from(json["varieties"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color.toMap(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x)),
        "evolution_chain": evolutionChain.toMap(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x)),
        "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": List<dynamic>.from(genera.map((x) => x)),
        "generation": generation.toMap(),
        "growth_rate": growthRate.toMap(),
        "habitat": habitat.toMap(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x)),
        "order": order,
        "pal_park_encounters":
            List<dynamic>.from(palParkEncounters.map((x) => x)),
        "pokedex_numbers": List<dynamic>.from(pokedexNumbers.map((x) => x)),
        "shape": shape.toMap(),
        "varieties": List<dynamic>.from(varieties.map((x) => x)),
      };
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  final String url;

  factory EvolutionChain.fromMap(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}

class NameUrl {
  NameUrl({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory NameUrl.fromMap(Map<String, dynamic> json) => NameUrl(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
