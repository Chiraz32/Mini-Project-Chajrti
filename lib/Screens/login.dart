// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClient = false;
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Image.asset("assets/connexionImage.png"),
                  ),
                  Text(
                    "Connexion",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: defaultFontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
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
                    obscureText: _obscureText,
                    enableSuggestions: false,
                    autocorrect: false,
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
                        Icons.lock_outline,
                        color: mainGreen,
                        size: defaultIconSize,
                      ),
                      suffixIcon:IconButton(
                          icon : Icon(
                            _obscureText ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                            color: mainGreen,
                            size: defaultIconSize,
                          ),
                          color: mainGreen,
                          iconSize: defaultIconSize,
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                      ),
                      
                      fillColor: lighterGreen,
                      hintStyle: TextStyle(
                        color: mainGreen,
                        fontFamily: defaultFontFamily,
                        fontSize: 16,
                      ),
                      hintText: "Mot de passe",
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: defaultFontFamily,
                      fontSize: 16,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //add checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: isClient,
                            onChanged: (bool? value) {
                              setState(() {
                                isClient = value!;
                              });
                            },
                            activeColor: mainGreen,
                          ),
                          Text(
                            "Je suis un Commerçant",
                            style: TextStyle(
                              color: mainGreen,
                              fontSize: 14,
                              fontFamily: 'Poppins-Medium.ttf',
                            ),
                          ),
                        ],
                      ),
                    ],
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
                      onPressed: () {},
                      child: Text(
                        "Se Connecter",
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
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
