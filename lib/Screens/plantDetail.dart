import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/Button.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

class PlantDetail extends StatefulWidget {
  const PlantDetail({super.key});

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton( color: darkGrey )
        ),
      body: ListView(
        children: [
          Center( child:Image.asset(plants[2].image,height: 300,) ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child:Padding(
                padding: EdgeInsets.only(left: 20),
                child:Text(plants[2].name,
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),)
                ), width: 270,),
              Padding(child:IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline,
                    color: Colors.black, size: 40),),
                padding:EdgeInsets.only(right: 15) ,),
              ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:Divider(color: Color.fromARGB(161, 98, 98, 98),thickness: 1,indent: 20,endIndent: 20,)
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child:SizedBox(
              width: double.infinity,
              child:Text("Description",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),textAlign: TextAlign.left,)
                  )
                  ),
          Padding(
            padding: EdgeInsets.only(left: 30,),
            child: SizedBox(
               width: double.infinity,
              child:Text(plants[2].description,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),textAlign: TextAlign.left,)
                  ),),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child:Divider(color: Color.fromARGB(161, 98, 98, 98),thickness: 1,indent: 20,endIndent: 20,)
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child:Padding(
                padding: EdgeInsets.only(left: 50),
                child:Column(crossAxisAlignment:CrossAxisAlignment.center ,children: [
                  Padding(padding:EdgeInsets.only(bottom: 7),child:Text('Prix:',
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkGrey)),),
                  Text(plants[2].price.toString() + " DT",
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),],)
                ),
                 ),
                Padding(padding:EdgeInsets.only(right: 30),child:
                  ElevatedButton(style: button,onPressed: () {},
                   child: Text('Commander',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)))
              ],
          ),
        ]),
    );
  }
}