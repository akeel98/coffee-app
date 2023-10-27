import 'package:coffy_application/screens/Auth%20Screens/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../consts.dart';
import '../../../repository/Auth/passwordSignUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController firstName = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool passObs = true;
  bool loading = false;
  bool isDarkMode = true;

  bool emailValid(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode == true ? darkBackground : lightBackground;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: loading == true
            ? Center(
                child: Image.asset("images/loading.gif"),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.width * 0.05),
                      Text(
                        "Login to Your Account",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: size.width * 0.08),
                      Center(
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.5,
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * 0.02,
                              horizontal: size.width * 0.05),
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.04)),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(-28, -28),
                                    color: isDarkMode
                                        ? const Color(0xFF35393F)
                                        : Colors.white,
                                    blurRadius: 30),
                                BoxShadow(
                                    offset: const Offset(28, 28),
                                    color: isDarkMode
                                        ? const Color(0xFF23262A)
                                        : const Color(0xFFA7A9AF),
                                    blurRadius: 30.0)
                              ]),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _form,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Email',
                                    controller: emailController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      if (!emailValid(val)) {
                                        return "Check Your Email";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Password',
                                    obscureText: passObs,
                                    suffix: passObs == true
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off,
                                    suffixOnPressed: () {
                                      setState(() {
                                        passObs = !passObs;
                                      });
                                    },
                                    controller: passwordController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      TextButton(
                                        onPressed: () {
                                          final email =
                                              emailController.text.trim();
                                          forgotPassword(
                                              email: email, context: context);
                                        },
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(color: mainColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (_form.currentState!.validate()) {
                                        final email =
                                            emailController.text.trim();
                                        final password =
                                            passwordController.text.trim();
                                        signInWithPassword(
                                            context: context,
                                            email: email,
                                            password: password);
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    },
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
                                  SizedBox(height: size.width * 0.02),
                                  Text(
                                    "OR",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: size.width * 0.04),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "SignUp",
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : mainColor,
                                            fontSize: size.width * 0.045),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  TextFormField formField({
    required Size size,
    required String label,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    IconData? suffix,
    Function()? suffixOnPressed,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(
              suffix,
              color: isDarkMode ? Colors.white : mainColor,
            ),
        ),
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
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: mainColor,
        )),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
      ),
    );
  }
}
