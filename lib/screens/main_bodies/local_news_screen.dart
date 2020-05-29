import 'package:flutter/material.dart';

import 'package:incite/models/article_model.dart';
import 'package:incite/models/category_model.dart';
import 'package:incite/providers/articles_data.dart';
import 'package:incite/providers/categories_data.dart';
import 'package:incite/widgets/articles_list.dart';
import 'package:incite/widgets/category_tile.dart';
import 'package:incite/providers/locations.dart';

var categories = new List<CategoryModel>();
List<ArticleModel> trendingLocalArticles = new List<ArticleModel>();

class LocalNewsScreen extends StatefulWidget {
  static const routeName = '/local-news';

  String location;

  LocalNewsScreen({this.location = 'za'});

  @override
  _LocalNewsScreenState createState() => _LocalNewsScreenState();
}

class _LocalNewsScreenState extends State<LocalNewsScreen> {
  bool _isLoading = true;

  void initState() {
    super.initState();
    categories = CategoriesData.getCategories();
    _getNews(widget.location);
  }

  void _getNews(String loc) async {
    var localNewsObject = LocalNews();
    await localNewsObject.getNews(loc);
    trendingLocalArticles = localNewsObject.articles;
    setState(() {
      _isLoading = false;
    });
  }

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    Locations.newsLocations.forEach((key, value) {
      var countryItem = DropdownMenuItem(
        child: Text(key),
        value: value,
      );
      dropdownItems.add(countryItem);
    });
    return dropdownItems;
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
                SizedBox(
                  height: 40,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Location:",
                          ),
                          DropdownButton(
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            value: widget.location,
                            items: getDropdownItems(),
                            onChanged: (value) {
                              setState(() {
                                widget.location = value;
                              });
                              _getNews(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                  child: ArticlesList(articles: trendingLocalArticles),
                ),
              ],
            ),
          );
  }
}
