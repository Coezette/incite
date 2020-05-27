import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'article_tile.dart';

class ArticlesList extends StatelessWidget {
  final List<ArticleModel> articles;

  ArticlesList({this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        return ArticleTile(
          title: articles[index].title,
          description: articles[index].description,
          imageURL: articles[index].urlToImage,
          url: articles[index].url,
        );
      },
    );
  }
}
