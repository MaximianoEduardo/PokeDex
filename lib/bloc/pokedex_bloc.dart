import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexBloc extends Cubit<PokedexState> {
  final PokemonRepository _repository;

  PokedexBloc(this._repository) : super(EmptyPokedex());

  Future getPokemons() async {
    emit(LoadingPokemons());

    try {
      final pokemon = await _repository.getPokemon('1');

      if (pokemon == null) {
        emit(Error(message: "Dados Vazios"));
      } else {
        emit(AllPokemons(pokemon: pokemon));
      }
    } on Exception catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }
  }
}

abstract class PokedexState {}

class EmptyPokedex extends PokedexState {}

class AllPokemons extends PokedexState {
  final Pokedex pokemon;

  AllPokemons({required this.pokemon});
}

class LoadingPokemons extends PokedexState {}

class Error extends PokedexState {
  final String message;

  Error({required this.message});
}
