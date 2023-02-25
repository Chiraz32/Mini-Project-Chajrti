import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';


class OrderCardClient extends StatelessWidget {
  late String image;
  late int price;
  late String plant;
  late String state;
  OrderCardClient(
    {
      super.key,
      required this.image,
      required this.price,
      required this.plant,
      required this.state,
    }
  );

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty == true) {
      image = "assets/defaultImage.jpg";
    } else {
      image = "assets/" + image;
    }
    debugPrint("image" + image );
    return Row(children: [
      const SizedBox(width: 5),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("Plante : $plant",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  textAlign: TextAlign.start
                )
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("Prix : $price dt",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  textAlign: TextAlign.start
                )
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child:Row(children: [
                  const Text("Etat : ",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.start),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                    decoration: BoxDecoration(
                      color: state == " Acceptée " ?const Color.fromARGB(255, 206, 253, 191): 
                        state== " Refusée " ? const Color.fromARGB(255, 218, 218, 218) 
                        : const Color.fromARGB(255, 253, 243, 191)  ,
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text(state,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                        textAlign: TextAlign.start
                      )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    ]);
  }
}
