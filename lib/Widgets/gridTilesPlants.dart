import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Screens/plantDetail_seller.dart';
import 'package:flutter/material.dart';

import '../Screens/plantDetail.dart';

class GridTilesPlants extends StatelessWidget {
  late String name;
  late String image;
  late String price;
  late Plant plant;
  late bool isClient;
  GridTilesPlants(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.plant,
      required this.isClient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  
                isClient== true? PlantDetail(
                      index: plant,
                    ): PlantDetailSeller (index :plant.id)),
          );
        }
        //plantDetail
        ,
        child: SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 244, 243),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/$image",
                        height: 120,
                      ),
                    ),
                    Flexible(
                        child: Text(
                            (name.length <= 40 ? name : name.substring(0, 40)),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto-Light.ttf',
                                fontSize: 20,
                                fontWeight: FontWeight.w700))),
                    Text("$price DT",
                        style: TextStyle(
                            color: mainGreen,
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.w400))
                  ]),
            ))
       

        );
  }
}
