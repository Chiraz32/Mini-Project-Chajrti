import 'dart:io';
import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Image_Picker extends StatefulWidget {
  @override
  _Image_PickerState createState() => _Image_PickerState();
}

class _Image_PickerState extends State<Image_Picker> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center,
        decoration: BoxDecoration(
          color:Color(0xffD8EAE1),
        ),
        child: 
        TextButton(
            onPressed: () {
              _getFromGallery();
              
            },
            child: 
            Padding (padding:EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1)
            ,child: Column(children: <Widget>[
                  displayImage(),
                  Padding(padding: EdgeInsets.only(top: 10),
                  child:  Icon(Icons.download, color: Colors.grey.shade600,size:35))
             
            ]))));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

 Widget displayImage(){
    if(imageFile == null){
      return Text("Importer une image",style: TextStyle(color: Colors.grey.shade600,fontSize:18 ));
    } else{
      return Image.file(imageFile!, width: 350, height: 350);
    }
  }
  }