import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';

class GridTilesPlants extends StatelessWidget {
  late String name;
  late String image;
  late String price;
 
  GridTilesPlants({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  }) ;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
     double height = size.height;
    double width = size.width;
    return InkWell(
      onTap: () {
        /* if (fromSubProducts) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsScreen(
                      slug: "products/?page=1&limit=12&category=" + slug,
                      name: name,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryScreen(
                      slug: slug,
                    )),
          );
        }*/
        //plantDetail
        Navigator.pushNamed(context, '/');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            color: lighterGreen ,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
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
                    padding: EdgeInsets.only(left: 20, right: 20, top:15),
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
                    padding: EdgeInsets.only( top: 10),
                    child: Text( "$price dt",
                        style: TextStyle(
                            color: mainGreen,
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
