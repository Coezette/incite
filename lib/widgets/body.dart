import 'package:flutter/material.dart';

import '../providers/articles_data.dart';
import '../providers/categories_data.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';

import 'articles_list.dart';
import 'category_tile.dart';

var categories = new List<CategoryModel>();
List<ArticleModel> articles = new List<ArticleModel>();

bool _isLoading = true;

class Body extends StatefulWidget {
  Body(this._index, this._updateIndex, {this.isMobile});

  int _index;
  Function _updateIndex;
  bool isMobile;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    categories = CategoriesData.getCategories();
    getNews();
  }

  void getNews() async {
    await News.getNews();
    articles = News.articles;
    setState(() {
      _isLoading = false;
    });
  }

  void _onTap(int currentIndex) {
    setState(() {
      widget._index = currentIndex;
    });
    widget._updateIndex(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: widget.isMobile
            ? MainBody(widget.isMobile)
            : Row(
                children: <Widget>[
                  NavigationRail(
                    destinations: [
                      NavigationRailDestination(
                          icon: Icon(Icons.home), label: Text('Home')),
                      NavigationRailDestination(
                          icon: Icon(Icons.trending_up),
                          label: Text('Trending')),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings), label: Text('Settings')),
                    ],
                    selectedIndex: widget._index,
                    selectedIconTheme: IconThemeData(color: Colors.green),
                    selectedLabelTextStyle: TextStyle(color: Colors.green),
                    extended: true,
                    minExtendedWidth: 160.0,
                    onDestinationSelected: _onTap,
                  ),
                  Expanded(child: MainBody(widget.isMobile)),
                ],
              ),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  bool isMobileVal;

  MainBody(this.isMobileVal);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Divider(
                  thickness: 1,
                ),
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
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: ArticlesList(articles: articles),
                ),
              ],
            ),
          );
  }
}
