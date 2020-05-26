import 'package:flutter/material.dart';
import 'package:incite/screens/article_view.dart';

class ArticleTile extends StatelessWidget {
  final String title, imageURL, description, url;

  ArticleTile({
    @required this.title,
    @required this.imageURL,
    @required this.description,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                articleURL: url,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 18),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              child: Image.network(imageURL),
            ),
            SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
