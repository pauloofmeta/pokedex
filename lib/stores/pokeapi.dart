import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:http/http.dart' as http;

part 'pokeapi.g.dart';

class Pokeapi = _Pokeapi with _$Pokeapi;

abstract class _Pokeapi with Store {

  @observable
  PokeAPI? _pokeAPI;

  @computed
  PokeAPI? get pokeAPI => _pokeAPI;

  @action
  Pokemon? getPokemon(int index) {
    return _pokeAPI?.pokemon![index];
  }

  @action
  fetchPokemonList() {
    loadPokerApi().then((value) => _pokeAPI = value);
  }

  Future<PokeAPI> loadPokerApi() async {
    try {
      final response = await http.get(Uri.parse(ConstApp.pokeapiURL));
      var decode = jsonDecode(response.body);
      return PokeAPI.fromJson(decode);
    } catch (error, stackTrace) {
      print("Erro ao carregar a lista" + stackTrace.toString());
      return PokeAPI();
    }
  }
}