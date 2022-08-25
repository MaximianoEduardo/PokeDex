import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Generation {
  generationI,
  generationII,
  generationIII,
  generationIV,
  generationV,
  generationVI,
  generationVII,
  generationVIII,
}

class PokedexBloc extends Cubit<PokedexState> {
  final PokemonRepository _repository;
  final List<Pokedex> pokemonsList = [];

  PokedexBloc(this._repository) : super(EmptyPokedex());

  listCompRange(int start, int stop, int step) {
    if (step == 0) throw Exception("Step cannot be 0");
    if (start == stop) return [];
    bool forwards = start < stop;
    return forwards == step > 0
        ? forwards
            ? [
                for (int i = 0; i * step <= stop - start; i++)
                  start + (i * step)
              ]
            : [for (int i = 0; i * step > stop - start; i++) start + (i * step)]
        : [];
  }

  listPokemons(
      int initialGeneration, int endGeneration, Generation generationName) {
    List generation = listCompRange(initialGeneration, endGeneration, 1);

    generation.map((e) => getPokemons(e.toString(), generationName)).toList();
  }

  setGeneration(generationName) {
    pokemonsList.clear();

    emit(ChangingGeneration(namegeneration: generationName));
  }

  Future getPokemons(idPokemon, Generation generation) async {
    emit(LoadingPokemons());

    try {
      final pokemon = await _repository.getPokemon(idPokemon.toString());
      pokemonsList.add(pokemon);

      var seen = <String>{};

      List<Pokedex> uniquenum = pokemonsList
          .where((pokemon) => seen.add(pokemon.id.toString()))
          .toList();

      uniquenum.sort((a, b) => a.id - b.id == 0 ? -1 : a.id - b.id);

      emit(PokemonList(
        pokemon: uniquenum,
        generation: generation,
      ));
    } on Exception catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }
  }

  // filterPokemon(pokemonSearched) {
  //   var seen = <String>{};

  //   List<Pokedex> uniquenum = pokemonsList
  //       .where((pokemon) => seen.add(pokemon.id.toString()))
  //       .toList();

  //   uniquenum.sort((a, b) => a.id - b.id == 0 ? -1 : a.id - b.id);

  //   List<Pokedex> searchedpokemonsList = uniquenum
  //       .where((pokemons) => pokemons.id == int.parse(pokemonSearched))
  //       .toList();

  //   emit(PokemonList(pokemon: searchedpokemonsList));
  // }
}

abstract class PokedexState {}

class EmptyPokedex extends PokedexState {}

class PokemonList extends PokedexState {
  final List<Pokedex> pokemon;
  final Generation generation;

  PokemonList({required this.pokemon, required this.generation});
}

class LoadingPokemons extends PokedexState {}

class Error extends PokedexState {
  final String message;

  Error({required this.message});
}

class ChangingGeneration extends PokedexState {
  final Generation namegeneration;

  ChangingGeneration({required this.namegeneration});
}
