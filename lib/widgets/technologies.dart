import 'package:authentication_app/data/home_page_data.dart';
import 'package:authentication_app/pages/details_page.dart';
import 'package:authentication_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Technologies extends StatelessWidget {
  const Technologies({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: homepage.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15, bottom: 15.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(id: index),
                      ),
                    );
                  },
                  child: Image.asset(
                    homepage[index].image,
                    fit: BoxFit.fill,
                    width: 150,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homepage[index].title,
                      style: AppText.title,
                    ),
                    SizedBox(height: 5),
                    Text(
                      homepage[index].cost.toString() + " \$",
                      style: AppText.price,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Text(
                          "4.8 reviews",
                          style: AppText.Description,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
