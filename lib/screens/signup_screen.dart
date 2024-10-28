// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:authentication_app/pages/home_page.dart';
import 'package:authentication_app/screens/login_screen.dart';
import 'package:authentication_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = "", email = "", password = "";
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null &&
        nameController.text != "" &&
        emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 18),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'Weak-Password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
              ),
            ),
          );
        } else if (e.code == "Email-Already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already Exists",
              ),
            ),
          );
        }
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
                            return 'Please Enter your Name';
                          }
                          return null;
                        },
                        controller: nameController,
                        cursorColor: AppColors.cardColor,
                        style: AppText.textStyle,
                        decoration: InputDecoration(
                          hintText: "Enter your Name",
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
                          prefixIcon: Icon(Icons.person_outline, size: 30),
                          prefixIconColor: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 25),
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
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    }
                    registration();
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
                        "Sign Up",
                        style: AppText.buttonStyle,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppText.textStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => LoginScreen()),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
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
