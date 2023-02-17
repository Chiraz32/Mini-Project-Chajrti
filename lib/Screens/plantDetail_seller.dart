import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/Button.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

class PlantDetailSeller extends StatefulWidget {
  int index;
  PlantDetailSeller({super.key, required this.index});

  @override
  State<PlantDetailSeller> createState() => _PlantDetailSellerState();
}

class _PlantDetailSellerState extends State<PlantDetailSeller> {
  @override
  Widget build(BuildContext context) {
    String image;
    var plants = context.watch<FavoriteProvider>().myPlants;
    var favs = context.watch<FavoriteProvider>().myFav;
    if (plants[widget.index].image.isEmpty == true) {
      image = "assets/defaultImage.jpg";
    } else {
      image = "assets/" + plants[widget.index].image;
    }
    var newImage = image ;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(color: darkGrey)),
      body: ListView(children: [
        Center(
            child: Image.asset(
          newImage,
          height: 300,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    plants[widget.index].name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
              width: 270,
            ),
            Padding(
              child: IconButton(
                onPressed: () {
                  if (!favs.contains(plants[widget.index])) {
                    context
                        .read<FavoriteProvider>()
                        .addToList(plants[widget.index]);
                  } else {
                    context
                       .read<FavoriteProvider>()
                        .removeFromList(plants[widget.index]);
                  }
                },
                icon: favs.contains(plants[widget.index])
                    ? const Icon(Icons.favorite,
                        color: Color(0xff00703C), size: 40)
                    : const Icon(Icons.favorite_outline,
                        color: Colors.black, size: 40),
              ),
              padding: EdgeInsets.only(right: 15),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color.fromARGB(161, 98, 98, 98),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            )),
        Padding(
            padding: EdgeInsets.only(left: 30),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ))),
        Padding(
          padding: EdgeInsets.only(left: 30, top: 8),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                plants[widget.index].description,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                textAlign: TextAlign.left,
              )),
        ),
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: Divider(
              color: Color.fromARGB(161, 98, 98, 98),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text('Prix:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: darkGrey)),
                      ),
                      Text(plants[widget.index].price.toString() + " DT",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(right: 30),
                child: ElevatedButton(
                    style: button,
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/ProductList_Seller');
                      });
                    },
                    child: Text(
                      'supprimer',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    )))
          ],
        ),
      ]),
    );
  }
}
