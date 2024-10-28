import 'package:flutter/material.dart';

class AppColors {
  static const bgColor = Color(0xff002147);
  static const bgColor2 = Color(0xff00416A);
  static const cardColor = Colors.white;
  static const priceColor = Colors.red;
  static const description = Colors.grey;
}

class AppText {
  static const title = TextStyle(
    fontFamily: "Title",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const buttonStyle = TextStyle(
    fontFamily: "Title",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.white70,
  );
  static const price = TextStyle(
    fontFamily: "SubTitle",
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.priceColor,
  );
  static const textStyle = TextStyle(
    fontFamily: "SubTitle",
    fontSize: 16,
    color: AppColors.cardColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.7,
    height: 1.5,
  );
  static const hintStyle = TextStyle(
    fontFamily: "Title",
    fontSize: 18,
    color: Colors.grey,
    fontWeight: FontWeight.w700,
  );

  static const buttonText = TextStyle(
    fontFamily: "Title",
    fontSize: 18,
    color: Colors.amberAccent,
    fontWeight: FontWeight.w700,
  );
  static const Description = TextStyle(
    fontFamily: "Description",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.description,
  );
}
