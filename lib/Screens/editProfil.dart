// ignore_for_file: prefer_const_constructors, prefer_final_fields


import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/enum/user_role_enum.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../Models/Client.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    var user = Client(
        id: 1,
        name: "Idris",
        email: "test@test.t",
        image: "idrisphoto.jpg",
        role: UserRoleEnum.buyer,
        mdp: '',
        salt: '',
    );


    

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultIconSize = 20;
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
            Flexible(
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Mon Profile",
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
                                  image: AssetImage("assets/${user.image}"),
                                ),
                              ),
                              // child : Image.asset("assets/${user.image}"),
                            )
                          ),
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
                                    title: Text("Changez votre photo de profil",
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
                      controller: _name = TextEditingController(text: user.name),
                      onChanged: ((x) => {_name.text = x}),
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
                        hintText: "Nom d'utilisateur",
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
                      controller: _email = TextEditingController(text: user.email),
                      onChanged: ((x) => {_email.text = x}),
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
                        hintText: "Email",
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
                      controller: _phone = TextEditingController(text: "${user.phone ?? ""}") ,
                      onChanged: ((x) => {_phone.text = x}),
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
                        hintText: "Numéro de téléphone",
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: mainGreen),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(mainGreen),
                        ),
                        onPressed: () {
                          if (_email.text == "" || _name.text == "") {
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
                                      Text("Email ou nom d'utilisateur vide"),
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
                          } else if (!EmailValidator.validate(_email.text)) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Erreur",
                                      style: TextStyle(
                                          color: mainGreen,
                                          fontFamily: defaultFontFamily,
                                          fontSize: 20)),
                                  content: Text("Email non valid"),
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
                          } else if (_phone.text != "" &&
                              _phone.text.length != 8) {
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
                                      Text("Numéro de téléphone non valid"),
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

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text("votre profile sera modifié"),
                                  actions: [
                                    TextButton(
                                      child: Text("Enregistrer/Déconnexion",
                                          style: TextStyle(
                                              color: mainGreen,
                                              fontFamily: defaultFontFamily,
                                              fontSize: 16)),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pushNamed(
                                              context, '/Login');
                                        });
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
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(17.0)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.red.shade700),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red.shade700),
                          ),
                         
                        
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Deconnexion",
                                    style: TextStyle(
                                        color: Colors.red.shade700,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 20)),
                                content:
                                    Text("Vouller vous vraiment vous déconnecter ?"),
                                actions: [
                                  TextButton(
                                    child: Text("Oui",
                                        style: TextStyle(
                                            color: Colors.red.shade700,
                                            fontFamily: defaultFontFamily,
                                            fontSize: 20)),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pushNamed(context, '/Login');
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Déconnexion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium.ttf',

                          ),
                        )),),
                    SizedBox(
                      height: 10,
                    ),
                  ]
                  ),
                  
            ),
          ],
        ),
      ),
    );
  }
}
