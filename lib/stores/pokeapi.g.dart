// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pokeapi on _Pokeapi, Store {
  Computed<PokeAPI?>? _$pokeAPIComputed;

  @override
  PokeAPI? get pokeAPI => (_$pokeAPIComputed ??=
          Computed<PokeAPI?>(() => super.pokeAPI, name: '_Pokeapi.pokeAPI'))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_Pokeapi._pokeAPI');

  @override
  PokeAPI? get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI? value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$_PokeapiActionController = ActionController(name: '_Pokeapi');

  @override
  Pokemon? getPokemon(int index) {
    final _$actionInfo =
        _$_PokeapiActionController.startAction(name: '_Pokeapi.getPokemon');
    try {
      return super.getPokemon(index);
    } finally {
      _$_PokeapiActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeapiActionController.startAction(
        name: '_Pokeapi.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeapiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeAPI: ${pokeAPI}
    ''';
  }
}
