import 'package:flutter/material.dart';

import 'package:incite/models/article_model.dart';
import 'package:incite/models/category_model.dart';
import 'package:incite/providers/articles_data.dart';
import 'package:incite/providers/categories_data.dart';

import 'package:incite/widgets/articles_list.dart';
import 'package:incite/widgets/category_tile.dart';

var categories = new List<CategoryModel>();
List<ArticleModel> trendingArticles = new List<ArticleModel>();

bool _isLoading = true;

class TrendingNewsMainBody extends StatefulWidget {
  @override
  _TrendingNewsMainBodyState createState() => _TrendingNewsMainBodyState();
}

class _TrendingNewsMainBodyState extends State<TrendingNewsMainBody> {
  void initState() {
    super.initState();
    categories = CategoriesData.getCategories();
    getNews();
  }

  void getNews() async {
    await TrendingNews.getNews();
    trendingArticles = TrendingNews.articles;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Divider(thickness: 1),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) {
                      return CategoryTile(
                        categoryName: categories[index].name,
                      );
                    },
                  ),
                ),
                Divider(thickness: 1),
                Expanded(
                  child: ArticlesList(articles: trendingArticles),
                ),
              ],
            ),
          );
  }
}
