import 'package:coffy_application/screens/Auth%20Screens/signUpScreen.dart';
import 'package:coffy_application/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Color(0xff000000),
        // brightness: Brightness.dark
      ),
      home: const SignUpScreen(),
    );
  }
}