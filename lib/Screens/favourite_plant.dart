import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("  Liste des favoris",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite,
                    color: Color(0xff00703C), size: 30),
              ),
            )
          ],
          backgroundColor: Colors.white,
          leading: BackButton( color: darkGrey )
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: (plants.length) / 2,
          mainAxisSpacing: (plants.length) / 2,
          shrinkWrap: true,
          children: List<Widget>.generate(plants.length-1, (index) {
            return GridTile(
                child: GridTilesPlants(
              name: plants[index].name,
              image: plants[index].image,
              price: plants[index].price.toString(),
            ));
          }),
        ),
        bottomNavigationBar: BottomBar(
          isClient: true,
        ));
  }
}
