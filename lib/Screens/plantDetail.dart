import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/Providers/user_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/Button.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

class PlantDetail extends StatefulWidget {
  int index;
  
  PlantDetail({super.key, required this.index});

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
   
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final UserProvider auth = Provider.of<UserProvider>(context);
    String image;
    var plants = context.watch<FavoriteProvider>().myPlants;
    var favs = context.watch<FavoriteProvider>().myFav;
    if (plants[widget.index].image.isEmpty == true) {
      image = "assets/defaultImage.jpg";
    } else {
      image = "assets/${plants[widget.index].image}";
    }
    var newImage =  image;
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
            SizedBox(
              // ignore: sort_child_properties_last
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    plants[widget.index].name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
              width: 270,
            ),
            Padding(
              // ignore: sort_child_properties_last
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
              padding: const EdgeInsets.only(right: 15),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color.fromARGB(161, 98, 98, 98),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            )),
        const Padding(
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
          padding: const EdgeInsets.only(left: 30, top: 8),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                plants[widget.index].description,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                textAlign: TextAlign.left,
              )),
        ),
        const Padding(
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
            Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text('Prix:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: darkGrey)),
                    ),
                    Text("${plants[widget.index].price} DT",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: ElevatedButton(
                    style: button,
                    onPressed: () {
                      setState(() {
                         debugPrint( plants[widget.index].toJson().toString());
                          provider.addOrder(
                              context,
                               plants[widget.index],
                              auth.user.token);
                          debugPrint("clicked");
                        
                        
                        Navigator.pushNamed(context, '/OrdersList_Client');
                      });
                    },
                    child: const Text(
                      'Commander',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    )))
          ],
        ),
      ]),
    );
  }
}
