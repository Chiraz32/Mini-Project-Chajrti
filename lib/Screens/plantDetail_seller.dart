import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Widgets/Button.dart';

import 'package:flutter/material.dart';

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
            SizedBox(
              width: 270,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    plants[widget.index].name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
            ),
            const Padding(

              padding: EdgeInsets.only(right: 15),
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
            Container(
              child: Padding(
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
                      Text(plants[widget.index].price.toString() + " DT",
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: ElevatedButton(
                    style: button,
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/ProductList_Seller');
                      });
                    },
                    child: const Text(
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
