import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Constants/api_urls.dart';

class Image_Picker extends StatefulWidget {
  @override
  _Image_PickerState createState() => _Image_PickerState();
}

class _Image_PickerState extends State<Image_Picker> {
  /// Variables
  File? imageFile;
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;
  String? _imagePath;
  String? get imagePath => _imagePath;

  Future<bool> upload(String token) async {
    bool success = false;
    http.StreamedResponse response = await uploadPlantImage(_pickedFile, token);
    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map["message"];
      success = true;
      _imagePath = message;
    }
    return success;
  }

  Future<http.StreamedResponse> uploadPlantImage(
      PickedFile? data, String token) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse(ApiUrls.baseURL + ApiUrls.uploadPlantImage));
    request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
    if (data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile(
          'image', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path.split('/').last));
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffD8EAE1),
        ),
        child: TextButton(
            onPressed: () {
              _getFromGallery();
            },
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Column(children: <Widget>[
                  displayImage(),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(Icons.download,
                          color: Colors.grey.shade600, size: 35))
                ]))));
  }

  /// Get from gallery
  _getFromGallery() async {
    _pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (_pickedFile != null) {
      setState(() {
        // imageFile = File(pickedFile.path);
      });
    }
  }

  Widget displayImage() {
    if (imageFile == null) {
      return Text("Importer une image",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18));
    } else {
      return Image.file(imageFile!, width: 350, height: 350);
    }
  }
}
