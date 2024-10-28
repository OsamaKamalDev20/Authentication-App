import 'package:authentication_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String email = "";
  TextEditingController emailController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            "Password Reset Email has been sent!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 20.0),
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
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                  fontFamily: "Title",
                  fontWeight: FontWeight.w700,
                  color: AppColors.cardColor,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter your Email",
              style: TextStyle(
                fontFamily: "SubTitle",
                fontWeight: FontWeight.w500,
                color: AppColors.cardColor,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: AppText.textStyle,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                              fontFamily: "SubTitle",
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 30,
                              color: Colors.white70,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                            });
                            resetPassword();
                          }
                        },
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.bgColor2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Send Email",
                              style: AppText.buttonStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
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
            ),
          ],
        ),
      ),
    );
  }
}
