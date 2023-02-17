// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, unnecessary_new
import 'package:chajrti/Models/Client.dart' as client;
import 'package:chajrti/Providers/user_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

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
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: Image.asset("assets/connexionImage.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Creer un compte",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: defaultFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _username,
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
                      Icons.person_outline,
                      color: mainGreen,
                      size: defaultIconSize,
                    ),
                    fillColor: lighterGreen,
                    hintStyle: TextStyle(
                      color: mainGreen,
                      fontFamily: defaultFontFamily,
                      fontSize: 16,
                    ),
                    hintText: "Username",
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
                  controller: _phone,
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
                      Icons.phone_android,
                      color: mainGreen,
                      size: defaultIconSize,
                    ),
                    fillColor: lighterGreen,
                    hintStyle: TextStyle(
                      color: mainGreen,
                      fontFamily: defaultFontFamily,
                      fontSize: 16,
                    ),
                    hintText: "Phone Number",
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
                TextButton(
                  child: Text(
                    "J'ai deja un compte",
                    style: TextStyle(
                      color: mainGreen,
                      fontFamily: defaultFontFamily,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
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
                      if (_email.text == "" ||
                          _password.text == "" ||
                          _username.text == "" ||
                          _phone.text == "") {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Erreur",
                                  style: TextStyle(
                                      color: mainGreen,
                                      fontFamily: defaultFontFamily,
                                      fontSize: 20)),
                              content: Text("Veuillez remplir tous les champs"),
                              actions: [
                                TextButton(
                                  child: Text("OK",
                                      style: TextStyle(
                                        color: mainGreen,
                                        fontFamily: defaultFontFamily,
                                        fontSize: 16,
                                      )),
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
                                      )),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (_phone.text != "" && _phone.text.length != 8) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Erreur",
                                  style: TextStyle(
                                      color: mainGreen,
                                      fontFamily: defaultFontFamily,
                                      fontSize: 20)),
                              content: Text("Numéro de téléphone non valid"),
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
                        final Future<Map<String, dynamic>> result =
                            auth.register(
                                _email.text.toString(),
                                _password.text.toString(),
                                _username.text.toString(),
                                _phone.text.toString());
                        result.then((response) {
                          debugPrint(response.toString());
                          if (response['status']) {
                            setState(() {
                              Navigator.pushNamed(context, '/Login');
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
                                    content: Text(
                                        "the email and password that you entered do not match our records. Please try again"),
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
                      "S'inscrire",
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
          ],
        ),
      ),
    );
  }
}
