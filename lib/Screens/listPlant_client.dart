import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlantList_Client extends StatefulWidget {
  const PlantList_Client({super.key});

  @override
  State<PlantList_Client> createState() => _PlantsList_ClientState();
}

class _PlantsList_ClientState extends State<PlantList_Client> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:Column(
        ),
      bottomNavigationBar: BottomBar(isClient: true,),
    );
  }
}