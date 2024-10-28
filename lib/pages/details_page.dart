import 'package:animate_do/animate_do.dart';
import 'package:authentication_app/data/detail_page_data.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    descriptions[widget.id].image,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            FadeInLeft(
              delay: Duration(milliseconds: 3000),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          descriptions[widget.id].title,
                          style: AppText.title,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            FadeInLeft(
              delay: Duration(milliseconds: 3000),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: Colors.amber,
                            ),
                            Text(
                              "4.8 ratings",
                              style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      descriptions[widget.id].description,
                      style: AppText.Description,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            FadeInLeft(
              delay: Duration(milliseconds: 3500),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bgColor2,
                    minimumSize: Size(1024, 40),
                  ),
                  onPressed: () {},
                  child: Text(
                    "ENROLL NOW",
                    style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
