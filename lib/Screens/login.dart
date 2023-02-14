// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, unnecessary_new
import 'package:chajrti/Models/Client.dart' as client;
import 'package:chajrti/Providers/user_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chajrti/enum/user_role_enum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context);
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultIconSize = 20;
    client.Client user;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
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
                    controller: _email,
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
                    controller: _password,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
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

                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
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
                      onPressed: ()async {

                        if (_email.text == "" || _password.text == "") {
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
                                    Text("Veuillez remplir tous les champs"),
                                actions: [
                                  TextButton(
                                    child: Text("OK",
                                      style: TextStyle(
                                        color: mainGreen,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 16,
                                      )
                                    ),
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
                                        fontSize: 16,
                                      )
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {

                          final Future<Map<String, dynamic>> result = 
                              auth.login(_email.text.toString(),
                                  _password.text.toString());

                         await result.then((response) {
                            if (response['status']) {
                              user = response['user'];
                              Provider.of<UserProvider>(context, listen: false)
                                  .setUser(user);
                              if (user.role == UserRoleEnum.seller) {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, '/ProductList_Seller');
                                });
                              } else if (user.role == UserRoleEnum.buyer) {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, '/ProductList_Client');
                                });
                              }
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
                                content: Text("the email and password that you entered do not match our records. Please try again"),
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
                                  });

                            }
                          });
                        }
                      },
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
