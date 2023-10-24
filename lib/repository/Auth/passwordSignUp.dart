import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffy_application/consts.dart';
import 'package:coffy_application/screens/Auth%20Screens/loginScreen.dart';
import 'package:coffy_application/screens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

signUpWithPassword(
    {required context, required email, required password}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      mySnackBar(
          context: context, message: 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      mySnackBar(
          context: context,
          message: 'The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signInWithPassword(
    {required context, required email, required password}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        title: 'Error',
        desc:
            'We Send Verified Email To: ${FirebaseAuth.instance.currentUser!.email} Please Check It to Continue',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      mySnackBar(context: context, message: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      mySnackBar(
          context: context, message: 'Wrong password provided for that user.');
    } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
      mySnackBar(context: context, message: 'Something went wrong');
    }
  }
}
