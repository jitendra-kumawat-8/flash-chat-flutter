import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'components/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  User user;
   String loginEmail;
   String loginPass;
   bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  loginEmail = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your E-mail')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  loginPass = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButtonWidget(whatColor: Colors.lightBlueAccent, textForButton: 'Login', onPressed: () async{
                setState(() {
                  _saving = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: loginEmail, password: loginPass);
                  if(user != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                    print(user.user.email);
                  }
                  setState(() {
                    _saving = false;
                  });
                }
                catch(e){
                  print(e);
                }
                },)
            ],
          ),
        ),
      ),
    );
  }
}
