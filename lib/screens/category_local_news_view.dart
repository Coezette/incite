import 'package:flutter/material.dart';

import '../providers/articles_data.dart';
import '../models/article_model.dart';

import '../widgets/articles_list.dart';

List<ArticleModel> _articles = new List<ArticleModel>();

class CategoryLocalNewsView extends StatefulWidget {
  final String category;
  final String location;

  CategoryLocalNewsView({this.category, this.location});

  @override
  _CategoryLocalNewsViewState createState() => _CategoryLocalNewsViewState();
}

class _CategoryLocalNewsViewState extends State<CategoryLocalNewsView> {
  bool _isLoading = true;

  void initState() {
    super.initState();
    _getCategoryLocalNews(widget.location, widget.category);
  }

  void _getCategoryLocalNews(String loc, String cat) async {
    var categoryLocalNewsObject = LocalNewsByCategory();
    await categoryLocalNewsObject.getNews(loc, cat);
    _articles = categoryLocalNewsObject.articles;
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
                      ArticlesList(articles: _articles),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
