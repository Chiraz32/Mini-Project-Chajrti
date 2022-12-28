import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderCard extends StatelessWidget {
  late String image;
  late int price;
  late String plant;
  late String ClientId;
  OrderCard(
      {super.key,
      required this.image,
      required this.price,
      required this.plant,
      required this.ClientId});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 5),
      Card(
        elevation: 0,
        color: lighterGreen,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        )),
        child: Image.asset(
          image,
          width: 80,
          height: 80,
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text("Plante : $plant",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        leadingDistribution: TextLeadingDistribution.even,),
                       textAlign: TextAlign.center)),
            Text("Prix : $price dt",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text("Plante : $ClientId",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                         textAlign: TextAlign.center)),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.check_circle_outline, color: mainGreen, size:30)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle_outline,
                    color: Colors.red.shade600, size: 30)),
          )
        ],
      )
    ]);
  }
}
