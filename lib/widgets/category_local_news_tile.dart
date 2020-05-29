import 'package:flutter/material.dart';
import 'package:incite/screens/category_local_news_view.dart';
import '../screens/category_news_view.dart';

class CategoryLocalTile extends StatelessWidget {
//  final String imageURL;  //not using the image for now, but just in-case
  final String categoryName;
  final String locationName;

  CategoryLocalTile({this.categoryName, this.locationName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryLocalNewsView(
                      category: categoryName.toLowerCase(),
                      location: locationName.toLowerCase(),
                    )));
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Center(child: Text(categoryName)),
        decoration: BoxDecoration(
          color: Colors.white70,
        ),
      ),
    );
  }
}
