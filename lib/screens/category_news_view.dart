import 'package:flutter/material.dart';

import '../providers/articles_data.dart';
import '../models/article_model.dart';

import '../widgets/articles_list.dart';

class CategoryNewsView extends StatefulWidget {
  final String category;

  CategoryNewsView({this.category});

  @override
  _CategoryNewsViewState createState() => _CategoryNewsViewState();
}

class _CategoryNewsViewState extends State<CategoryNewsView> {
  bool _isLoading = true;

  List<ArticleModel> articles = new List<ArticleModel>();

  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    await CategoryNews.getNews(widget.category);
    articles = CategoryNews.articles;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/incite-logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ArticlesList(articles: articles),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
