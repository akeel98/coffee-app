import 'package:coffy_application/consts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/Auth/passwordSignUp.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
  bool emailValid(email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);}
  @override

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: loading == true?
         Center(
          child: Image.asset("images/loading.gif"),
        ) : Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: size.width * 0.08,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.width * 0.03),
                    Text(
                      "Create a new account",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                      size: size,
                      label: 'First Name',
                      prefix: Icons.person,
                      controller: firstNameController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                      },
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size, label: 'Last Name', prefix: Icons.person,
                        controller: lastNameController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                      },
                        ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size,
                        label: 'Address one',
                        prefix: Icons.location_on_rounded,
                        controller: addressOneController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                      },
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size,
                        label: 'Address Two',
                        prefix: Icons.location_on_rounded,
                        controller: addressTwoController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                      },
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size, label: 'Email', prefix: Icons.email_outlined,
                        controller: emailController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                        if(!emailValid(val)){
                          return "Check Your Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size,
                        label: 'Password',
                        prefix: Icons.password,
                        obscureText: passObs,
                        suffix: passObs == true? Icons.remove_red_eye_outlined : Icons.visibility_off,
                        suffixOnPressed: (){
                          setState(() {
                            passObs = !passObs;
                          });
                        },
                        controller: passwordController,
                        validator: (String? val) {
                          if(val == "" || val!.isEmpty){
                            return "This Field Can't be Null !!";
                          }
                        },
                    ),
                    SizedBox(height: size.width * 0.03),
                    formField(
                        size: size,
                        label: 'Confirm Password',
                        prefix: Icons.password,
                        obscureText: confirmPassObs,
                        suffix: confirmPassObs == true? Icons.remove_red_eye_outlined : Icons.visibility_off,
                        suffixOnPressed: (){
                          setState(() {
                            confirmPassObs = !confirmPassObs;
                          });
                        },
                        controller: confirmPasswordController,
                      validator: (String? val) {
                        if(val == "" || val!.isEmpty){
                          return "This Field Can't be Null !!";
                        }
                        if(val != passwordController.text){
                          return "Not Correct";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.width * 0.03),
                    InkWell(
                      onTap: () async{
                        setState(() {
                          loading = true;
                        });
                        if(_form.currentState!.validate()){
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          signUpWithPassword(email: email, password: password, context: context);

                          //Save Informations to SharedPrefs
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString("firstName", firstNameController.text);
                          await prefs.setString("lastName", lastNameController.text);
                          await prefs.setString("addressOne", addressOneController.text);
                          await prefs.setString("addressTwo", addressTwoController.text);
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
                    SizedBox(height: size.width * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an Account??"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            "Login",
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
      ),
    );
  }

  TextFormField formField({
    required Size size,
    required String label,
    required IconData prefix,
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
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        prefixIconColor: mainColor,
        suffixIcon: IconButton(onPressed: suffixOnPressed, icon: Icon(suffix)),
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
        border: OutlineInputBorder(
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
