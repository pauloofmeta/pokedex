import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final int index;
  final List<String> types;
  final String num;

  const PokemonItem(
      {Key? key,
      required this.name,
      required this.index,
      required this.types,
      required this.num})
      : super(key: key);

  Widget getImage({String numero = ''}) {
    return CachedNetworkImage(
      height: 100,
      width: 100,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Widget getTypes() {
    var _types = <Widget>[];
    types.forEach((pokeType) {
      _types.add(Column(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(80, 255, 255, 255)),
            child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(pokeType.trim(),
                    style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ));
    });

    return Column(
      children: _types,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: ConstApp.getColorType(type: types[0]),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getTypes(),
                  )
                ]),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      ConstApp.whitePokeball,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: getImage(numero: num),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
