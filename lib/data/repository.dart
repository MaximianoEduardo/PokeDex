import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:app_pokedex/common/failure.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/models/pokemons.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
  Future<PokemonInfo> getPokemonsInfo(id);
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;
  final int id;

  PokemonRepository(
    this.id, {
    required this.dio,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/MaximianoEduardo/PokeDex/main/lib/database/pokemons.json',
      );
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemons'] as List<dynamic>;

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Erro ao Carregar Dados');
    }
  }

  @override
  Future<PokemonInfo> getPokemonsInfo(id) async {
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

      final json = PokemonInfo.fromMap(response.data);

      return json;
    } catch (e) {
      throw Failure(
        message: 'Erro ao Carregar Dados',
      );
    }
  }
}
