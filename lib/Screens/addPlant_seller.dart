import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPlant_Seller extends StatefulWidget {
  const AddPlant_Seller({super.key});

  @override
  State<AddPlant_Seller> createState() => _AddPlant_SellerState();
}

class _AddPlant_SellerState extends State<AddPlant_Seller> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _price = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffD8EAE1),
            leading: BackButton(color: Colors.grey.shade700)),
        body: 
        Padding(padding: EdgeInsets.only(bottom:10) ,
         child: ListView(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2.7,
                width: MediaQuery.of(context).size.width,
                child: Image_Picker()),
                

              
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                controller: _name,
                showCursor: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: grey,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Nom du plante",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _price,
                showCursor: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: grey,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Prix",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                minLines: 4,
                maxLines: 6,
                controller: _description,
                showCursor: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: grey,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Description",
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.0002),
                child: IconButton(
                    icon: Icon(Icons.add_circle, size: 55, color: mainGreen),
                    onPressed: (() {}))),
                    SizedBox(height:15)



          ],
        
        )
        )
        );
  }
}
