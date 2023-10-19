import 'package:coffy_application/consts.dart';
import 'package:coffy_application/screens/Auth%20Screens/signUpScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: size.width * 0.08,
                        color: mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.width * 0.03),
                  Text(
                    "Sign to continue",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: size.width * 0.03),
                  formField(
                      size: size, label: 'Email', prefix: Icons.email_outlined),
                  SizedBox(height: size.width * 0.03),
                  formField(
                      size: size,
                      label: 'Password',
                      prefix: Icons.password,
                      suffix: Icons.remove_red_eye_outlined),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: mainColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.03),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width,
                      height: size.height * 0.055,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.03)),
                        color: mainColor,
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account??"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          "Create a New Account",
                          style: TextStyle(color: mainColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField formField({
    required Size size,
    required String label,
    required IconData prefix,
    IconData? suffix,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        prefixIconColor: mainColor,
        suffixIcon: Icon(suffix),
        suffixIconColor: mainColor,
        contentPadding: EdgeInsets.only(
            top: 0,
            bottom: 0,
            left: size.width * 0.04,
            right: size.width * 0.04),
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
            borderSide: BorderSide(
              color: mainColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
      ),
    );
  }
}
