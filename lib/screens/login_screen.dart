// ignore_for_file: unused_local_variable

import 'package:authentication_app/pages/home_page.dart';
import 'package:authentication_app/screens/forget_password_screen.dart';
import 'package:authentication_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      } else if (e.code == 'Wrong-Password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/background-image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        cursorColor: AppColors.cardColor,
                        style: AppText.textStyle,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          hintStyle: AppText.hintStyle,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.bgColor2,
                          prefixIcon: Icon(Icons.email_outlined, size: 30),
                          prefixIconColor: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        cursorColor: AppColors.cardColor,
                        style: AppText.textStyle,
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: AppText.hintStyle,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.bgColor2,
                          prefixIcon:
                              Icon(Icons.remove_red_eye_outlined, size: 30),
                          prefixIconColor: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(
                        () {
                          email = emailController.text;
                          password = passwordController.text;
                        },
                      );
                    }
                    userLogin();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor2,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: AppText.buttonStyle,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ForgetPasswordScreen()),
                    ),
                  );
                },
                child: Text(
                  "Forget Password?",
                  style: AppText.hintStyle,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppText.textStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SignUpScreen()),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: AppText.buttonText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
