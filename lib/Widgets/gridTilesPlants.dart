import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../Screens/plantDetail.dart';

class GridTilesPlants extends StatelessWidget {
  late String name;
  late String image;
  late String price;
  late int index;

  GridTilesPlants(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.index});

  @override
  Widget build(BuildContext context) {
    if (image == "") {
      image = "assets/defaultImage.jpg";
    }
    else{
      image = "assets/" + image;
    }
    
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantDetail(
                      index: index,
                    )),
          );
        }
        //plantDetail
        ,
        child: Container(
            height: 160,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      child: Image.asset(
                        image,
                        height: 120,
                      ),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 242, 244, 243),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Flexible(
                        child: Container(
                      child: Text(
                          (name.length <= 40 ? name : name.substring(0, 40)),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto-Light.ttf',
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    )),
                    Container(
                      child: Text("$price DT",
                          style: TextStyle(
                              color: mainGreen,
                              fontFamily: 'Roboto-Light.ttf',
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    )
                  ]),
            ))
        /*Card(
            color: lighterGreen,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            elevation: 0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    image,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Text(
                        (name.length <= 40 ? name : name.substring(0, 40)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(top: 10),
                    child: Text("$price DT",
                        style: TextStyle(
                            color: mainGreen,
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            )),*/

        );
  }
}
