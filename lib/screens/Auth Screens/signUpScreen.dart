import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../consts.dart';
import '../../repository/Auth/passwordSignUp.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstName = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressOneController.dispose();
    addressTwoController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  bool passObs = true;
  bool confirmPassObs = true;
  bool loading = false;
  bool isDarkMode = false;

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.width * 0.05),
                      Text(
                        "Choose a Way To Join Us",
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
                          height: size.height * 0.75,
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
                                    "Sign Up With Email And Password",
                                    style: TextStyle(
                                      fontSize: size.width * 0.042,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'First Name',
                                    controller: firstNameController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Last Name',
                                    controller: lastNameController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Address one',
                                    controller: addressOneController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Address Two',
                                    controller: addressTwoController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      return null;
                                    },
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
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.03),
                                  formField(
                                    size: size,
                                    label: 'Confirm Password',
                                    obscureText: confirmPassObs,
                                    suffix: confirmPassObs == true
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off,
                                    suffixOnPressed: () {
                                      setState(() {
                                        confirmPassObs = !confirmPassObs;
                                      });
                                    },
                                    controller: confirmPasswordController,
                                    validator: (String? val) {
                                      if (val == "" || val!.isEmpty) {
                                        return "This Field Can't be Null !!";
                                      }
                                      if (val != passwordController.text) {
                                        return "Not Correct";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.width * 0.05),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (_form.currentState!.validate()) {
                                        String email =
                                            emailController.text.trim();
                                        String password =
                                            passwordController.text.trim();
                                        signUpWithPassword(
                                            email: email,
                                            password: password,
                                            context: context);

                                        //Save Informations to SharedPrefs
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        await prefs.setString("firstName",
                                            firstNameController.text);
                                        await prefs.setString("lastName",
                                            lastNameController.text);
                                        await prefs.setString("addressOne",
                                            addressOneController.text);
                                        await prefs.setString("addressTwo",
                                            addressTwoController.text);
                                        //#########################################
                                        setState(() {
                                          loading = false;
                                        });
                                      }
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
                                        "CREATE ACCOUNT",
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
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Login",
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
                      SizedBox(height: size.width * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.5)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(28, 28),
                                      color: isDarkMode
                                          ? const Color(0xFF23262A)
                                          : const Color(0xFFA7A9AF),
                                      blurRadius: 30.0)
                                ]),
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              size: size.width * 0.06,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.5)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(28, 28),
                                      color: isDarkMode
                                          ? const Color(0xFF23262A)
                                          : const Color(0xFFA7A9AF),
                                      blurRadius: 30.0)
                                ]),
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              size: size.width * 0.06,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.5)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(28, 28),
                                      color: isDarkMode
                                          ? const Color(0xFF23262A)
                                          : const Color(0xFFA7A9AF),
                                      blurRadius: 30.0)
                                ]),
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              size: size.width * 0.06,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      )
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
