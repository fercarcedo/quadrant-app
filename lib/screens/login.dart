import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quadrant/i18n/app_messages.dart';
import 'package:quadrant/screens/util/sharedaxisroute.dart';
import 'dart:ui' as ui;

import 'package:quadrant/screens/verifyemail.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool signup;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.signup = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(
                        width: 100,
                        height: 100
                      ),
                      child: Image(image: AssetImage('assets/ic_launcher.png')),
                    ),
                    Text(
                      AppMessages.of(context).appName,
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)
                    )  
                  ],
                )
              )
            ),
              Row(children: <Widget>[
                FlatButton(
                  autofocus: false,
                  clipBehavior: Clip.none,
                  disabledTextColor: Colors.black,
                  textColor: Colors.grey,
                  child: Text(AppMessages.of(context).signIn, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: !signup ? null : (){
                    setState(() {
                      signup = false;
                    });
                  },
                ),
                FlatButton(
                  autofocus: false,
                  clipBehavior: Clip.none,
                  disabledTextColor: Colors.black,
                  textColor: Colors.grey,
                  child: Text(AppMessages.of(context).signUp, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: signup ? null : (){
                    setState(() {
                      signup = true;
                    });
                  },
                )
              ]),
              Visibility(
                visible: signup,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).accentColor)
                        ),
                        enabledBorder: OutlineInputBorder(),
                        labelText: AppMessages.of(context).name,
                        labelStyle: TextStyle(color: Colors.black)
                      )
                    )
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).accentColor)
                    ),
                    enabledBorder: OutlineInputBorder(),
                    labelText: AppMessages.of(context).email,
                    labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    labelText: AppMessages.of(context).password,
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.blueAccent[200]
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  autofocus: false,
                  clipBehavior: Clip.none,
                  child: Text(AppMessages.of(context).forgotPassword),
                  onPressed: (){
                    _resetPassword(context);
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: RaisedButton(
                  autofocus: false,
                  color: Theme.of(context).accentColor,
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.all(16),
                  child: Text(signup ? AppMessages.of(context).signUpButton : AppMessages.of(context).signInButton),
                  onPressed: (){
                    if (signup) {
                      final route = SharedAxisPageRoute(page: VerifyEmailScreen(), transitionType: SharedAxisTransitionType.horizontal);
                      Navigator.push(context, route);
                      //_signUpWithEmailAndPassword();
                    } else {
                      _signInWithEmailAndPassword();
                    }
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1)
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(AppMessages.of(context).or),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1)
                  )
                ]), 
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: SignInButton(
                  Buttons.Google,
                  onPressed: (){
                    _signInWithGoogle();
                  },
                  text: AppMessages.of(context).signInWithGoogle,
                )
              )
          ],
        ),
        ),
      )
    );
  }

  void _signInWithEmailAndPassword() async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
      Fluttertoast.showToast(msg: user != null ? "Correcto" : "Incorrecto");
      print(user != null);
    } catch(e) {
      Fluttertoast.showToast(msg: "Error");
      print(e);
    }
  }

  void _signUpWithEmailAndPassword() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
      if (user != null) {
        await user.sendEmailVerification();
      }
      Fluttertoast.showToast(msg: user != null ? "Registro correcto" : "Registro incorrecto");
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error');
    }
  }

  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    Fluttertoast.showToast(msg: user != null ? "Correcto Google" : "Incorrecto Google");
    print(user != null ? "Correcto Google" : "Incorrecto Google");
  }

  void _resetPassword(BuildContext context) async {
    String email = await _showPasswordResetDialog(context);
    if (email != null && email.isNotEmpty) {
      await _auth.setLanguageCode(ui.window.locale.languageCode);
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: 'E-mail enviado');
    }
  }

  Future<String> _showPasswordResetDialog(BuildContext context) async {
    String email = "";
    return showModal<String>(
      context: context,
      configuration: FadeScaleTransitionConfiguration(),
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppMessages.of(context).enterEmail),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent[200]),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    labelText: AppMessages.of(context).email,
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.blueAccent[200]
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                )
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(AppMessages.of(context).submit),
              onPressed: () {
                Navigator.of(context).pop(email);
              }
            )
          ],
        );
      }
    );
  }
}