import 'package:coffy_application/screens/Auth%20Screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class personalScreen extends StatefulWidget {
  const personalScreen({Key? key}) : super(key: key);

  @override
  State<personalScreen> createState() => _personalScreenState();
}

class _personalScreenState extends State<personalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
          },
          child: Text("SignOut"),
        ),
      ),
    );
  }
}
