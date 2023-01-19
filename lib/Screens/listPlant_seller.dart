import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

class PlantList_Seller extends StatefulWidget {
  const PlantList_Seller({super.key});

  @override
  State<PlantList_Seller> createState() => _PlantList_SellerState();
}

class _PlantList_SellerState extends State<PlantList_Seller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 0,
          title: const Text("  Vos Produits",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline,
                    color: Colors.black, size: 30),
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: (plants.length) / 2,
          mainAxisSpacing: (plants.length) / 2,
          shrinkWrap: true,
          childAspectRatio: (185 / 225),          
          padding: EdgeInsets.all(10),
          children: List<Widget>.generate(plants.length, (index) {
            return GridTile(
                child: GridTilesPlants(
              name: plants[index].name,
              image: plants[index].image,
              price: plants[index].price.toString(),
              index: index,
            ));
          }),
        ),
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));

  }
}
//  appBar: AppBar(
//         elevation: 0,
//         title: const Text("  Vos Produits",
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black)),
//         actions: <Widget>[
//           Padding(padding: EdgeInsets.only(right: 20)
//           ,
//           child:IconButton(
//             onPressed: () {
//               setState(() {
//                 Navigator.pushNamed(context, '/AddPlant_Seller');
//               });
//             },
//             icon: const Icon(Icons.add_circle_outline, color: Colors.black,size:30),
//           ) ,)
          
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: (plants.length) / 2,
//         mainAxisSpacing: (plants.length) / 2,
//         shrinkWrap: true,
//         children: List<Widget>.generate(plants.length, (index) {
//       return GridTile(
//           child: GridTilesPlants(
           
//         name: plants[index].name,
//         image: plants[index].image,
//         price: plants[index].price.toString(),
//       ));
//     }),
//       ),

//       bottomNavigationBar: BottomBar(
//         isClient: false,
//       )
//       )
//       ;
    
