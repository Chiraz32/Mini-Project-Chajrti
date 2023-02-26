import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Client.dart' as client;
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/enum/user_role_enum.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Providers/user_provider.dart';

class ModifPlant extends StatefulWidget {
  int index;

  ModifPlant({super.key, required this.index});

  @override
  State<ModifPlant> createState() => _ModifPlantState();
}

class _ModifPlantState extends State<ModifPlant> {
  TextEditingController _name = TextEditingController();
  TextEditingController _prix = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FavoriteProvider provider = Provider.of<FavoriteProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    var plants = context.watch<FavoriteProvider>().myPlants;
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultIconSize = 20;
    client.Client user = auth.user;
    String image = plants[widget.index].image;
    if (image.isEmpty == true) {
      image = "assets/defaultImage.jpg";
    } else {
      image = "assets/" + plants[widget.index].image;
    }
    var newImage = image;
    debugPrint(newImage);
    // final Future<Map<String, dynamic>> result =
    //     auth.getInfo(auth.user.id, auth.token);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black)),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Text(
                "Modifier votre Plante",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("${newImage}"),
                      ),
                    ),
                  )),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit_note_rounded,
                        color: mainGreen,
                      ),
                      iconSize: defaultIconSize * 2.5,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Changez le nom de la plant",
                                  style: TextStyle(
                                      color: mainGreen,
                                      fontFamily: defaultFontFamily,
                                      fontSize: 20)),
                              actions: [
                                TextButton(
                                  child: Text("Importer",
                                      style: TextStyle(
                                          color: mainGreen,
                                          fontFamily: defaultFontFamily,
                                          fontSize: 16)),
                                  onPressed: () {
                                    // upload image
                                    // Future<XFile?> image = ImagePicker.pickImage(source: ImageSource.gallery);
                                    // final Future<Map<String, dynamic>?> editImage =
                                    //     auth.uploadProfileImaje(auth.user.id, File(image!.path, image.name), auth.token);
                                    // editImage.then((response) {
                                    //   if (response["status"]) {
                                    //     Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) => ModifPlant(),
                                    //       ),
                                    //     );
                                    //   } else {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (BuildContext context) {
                                    //         return AlertDialog(
                                    //           title: Text("Erreur",
                                    //               style: TextStyle(
                                    //                   color: mainGreen,
                                    //                   fontFamily: defaultFontFamily,
                                    //                   fontSize: 20)),
                                    //           content: Text(response["message"]),
                                    //           actions: [
                                    //             TextButton(
                                    //               child: Text("OK",
                                    //                   style: TextStyle(
                                    //                       color: mainGreen,
                                    //                       fontFamily: defaultFontFamily,
                                    //                       fontSize: 16)),
                                    //               onPressed: () {
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //             ),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   }
                                    // });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Annuler",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: defaultFontFamily,
                                          fontSize: 16)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _name =
                    TextEditingController(text: plants[widget.index].name),
                onChanged: ((x) =>
                    {_name.text = x, plants[widget.index].name = x}),
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person_pin,
                    color: mainGreen,
                    size: defaultIconSize,
                  ),
                  fillColor: lighterGreen,
                  hintStyle: TextStyle(
                    color: mainGreen,
                    fontFamily: defaultFontFamily,
                    fontSize: 16,
                  ),
                  hintText: "Nom de la plante",
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _prix = TextEditingController(
                    text: plants[widget.index].price.toString()),
                onChanged: ((x) => {
                      _prix.text = x,
                      if (_prix.text != "")
                        {plants[widget.index].price = int.parse(_prix.text)}
                      else
                        {plants[widget.index].price = 0}
                    }),
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: mainGreen,
                    size: defaultIconSize,
                  ),
                  fillColor: lighterGreen,
                  hintStyle: TextStyle(
                    color: mainGreen,
                    fontFamily: defaultFontFamily,
                    fontSize: 16,
                  ),
                  hintText: "Prix",
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _description = TextEditingController(
                    text: plants[widget.index].description),
                onChanged: ((x) => {
                      _description.text = x,
                      plants[widget.index].description = x
                    }),
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                    color: mainGreen,
                    size: defaultIconSize,
                  ),
                  fillColor: lighterGreen,
                  hintStyle: TextStyle(
                    color: mainGreen,
                    fontFamily: defaultFontFamily,
                    fontSize: 16,
                  ),
                  hintText: "Description",
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  //add padding to the button
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(17.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: mainGreen),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainGreen),
                  ),
                  onPressed: () {
                    if (_prix.text == "" && _name.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Erreur",
                                style: TextStyle(
                                    color: mainGreen,
                                    fontFamily: defaultFontFamily,
                                    fontSize: 20)),
                            content:
                                Text("Nom et/ou prix de la plante vide(s)"),
                            actions: [
                              TextButton(
                                child: Text("OK",
                                    style: TextStyle(
                                        color: mainGreen,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 16)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if ((_prix.text) == "0") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Erreur",
                                style: TextStyle(
                                    color: mainGreen,
                                    fontFamily: defaultFontFamily,
                                    fontSize: 20)),
                            content: Text("Prix est nul"),
                            actions: [
                              TextButton(
                                child: Text("OK",
                                    style: TextStyle(
                                        color: mainGreen,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 16)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Map<String, dynamic> data = {
                        "name": _name.text,
                        "price": int.parse(_prix.text),
                        "description": _description.text,
                      };
                      debugPrint(data.toString());
                      final Future<Map<String, dynamic>> editSave =
                          provider.updatePlant(
                              plants[widget.index].id, data, user.token);
                      editSave.then((response) {
                        if (response["status"]) {
                          Future.delayed((const Duration(milliseconds: 300)),
                              () {
                            Navigator.pushNamed(context, '/ProductList_Seller');
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Erreur",
                                    style: TextStyle(
                                        color: mainGreen,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 20)),
                                content: Text(response["message"]),
                                actions: [
                                  TextButton(
                                    child: Text("OK",
                                        style: TextStyle(
                                            color: mainGreen,
                                            fontFamily: defaultFontFamily,
                                            fontSize: 16)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    }
                  },
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins-Medium.ttf',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
