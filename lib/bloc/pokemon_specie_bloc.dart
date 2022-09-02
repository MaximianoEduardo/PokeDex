import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonSpecieBloc extends Cubit<PokemonSpecieState> {
  final PokemonRepository _repository;

  PokemonSpecieBloc(this._repository) : super(EmptyPokemonSpecieDetails());

  Future getPokemonSpecie(idPokemon) async {
    emit(LoadingPokemonSpecieDetails());

    try {
      final pokemonSpecieDetailsResponse =
          await _repository.getPokemonSpecie(idPokemon.toString());

      return emit(
        PokemonSpecieDetails(
          pokemonSpecie: pokemonSpecieDetailsResponse,
        ),
      );
    } on Exception {
      emit(
        Error(
          message:
              'Sorry, we Didnt find any pokemon related to your search! Try another one or changing how you searching.',
        ),
      );
    }
  }

  Future getPokemonEvolution(String pokemonChainID) async {
    try {
      emit(LoadingPokemonSpecieDetails());

      final pokemonEvolutionResponse =
          await _repository.getPokemonEvolution(pokemonChainID.toString());

      emit(PokemonEvolutionDetails(pokemonEvolution: pokemonEvolutionResponse));
    } on Exception {
      emit(
        Error(
          message:
              'Sorry, we Didnt find any pokemon related to your search! Try another one or changing how you searching.',
        ),
      );
    }
  }

  setInitialState() {
    emit(EmptyPokemonSpecieDetails());
  }
}

abstract class PokemonSpecieState {}

class LoadingPokemonSpecieDetails extends PokemonSpecieState {}

class Error extends PokemonSpecieState {
  final String message;

  Error({required this.message});
}

class EmptyPokemonSpecieDetails extends PokemonSpecieState {}

class PokemonSpecieDetails extends PokemonSpecieState {
  final PokemonSpecie pokemonSpecie;

  PokemonSpecieDetails({
    required this.pokemonSpecie,
  });
}

class PokemonEvolutionDetails extends PokemonSpecieState {
  final PokemonEvolution pokemonEvolution;

  PokemonEvolutionDetails({required this.pokemonEvolution});
}
