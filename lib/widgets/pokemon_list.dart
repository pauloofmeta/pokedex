import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/stores/pokeapi.dart';
import 'package:pokedex/widgets/pokemon_item.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Pokeapi? _pokeApiStore;

  @override
  void initState() {
    super.initState();
    _pokeApiStore = Pokeapi();
    _pokeApiStore?.fetchPokemonList();
  }

  pokeList() {
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: false,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _pokeApiStore?.pokeAPI?.pokemon?.length,
        itemBuilder: (context, index) {
          var pokemon = _pokeApiStore?.getPokemon(index);

          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: ScaleAnimation(
              child: GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PokemonItem(
                    index: index,
                    name: pokemon?.name ?? '',
                    num: pokemon?.num ?? '',
                    types: pokemon?.type ?? [],
                  )
                ),
                onTap: () {},
              ),
            )
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Observer(
          name: 'ListPokemon',
          builder: (BuildContext context) {
            return (_pokeApiStore?.pokeAPI != null)
              ? pokeList()
              : Center(
                  child: CircularProgressIndicator(),
                );
          }
        )
      )
    );
  }
}
