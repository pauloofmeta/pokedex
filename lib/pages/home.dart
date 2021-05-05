import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts.dart';
import 'package:pokedex/widgets/app_bar.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWitdh = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -(240 / 4.7),
            left: screenWitdh - (240/ 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(ConstApp.blackPokeball, height: 240, width: 240,),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(height: statusBar),
                HomeAppBar(),
                PokemonList()
              ],
            ),
          )
        ],
      ),
    );
  }
}