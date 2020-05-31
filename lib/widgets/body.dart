import 'package:flutter/material.dart';

import '../screens/main_bodies/covid_data_screen.dart';
import '../screens/main_bodies/local_news_screen.dart';
import '../screens/main_bodies/trending_news_main_body.dart';

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
            ? buildNewsMainBody(widget._index)
            : Row(
                children: <Widget>[
                  NavigationRail(
                    destinations: [
                      NavigationRailDestination(
                          icon: Icon(Icons.trending_up),
                          label: Text('Trending')),
                      NavigationRailDestination(
                          icon: Icon(Icons.not_listed_location),
                          label: Text('Local')),
                      NavigationRailDestination(
                          icon: Icon(Icons.scatter_plot),
                          label: Text('Covid-19 Data')),
                    ],
                    selectedIndex: widget._index,
                    selectedIconTheme: IconThemeData(color: Colors.blue),
                    selectedLabelTextStyle: TextStyle(color: Colors.blue),
                    extended: true,
                    minExtendedWidth: 160.0,
                    onDestinationSelected: _onTap,
                  ),
                  Expanded(child: buildNewsMainBody(widget._index)),
                ],
              ),
      ),
    );
  }

  StatefulWidget buildNewsMainBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return TrendingNewsMainBody();
        break;
      case 1:
        return LocalNewsScreen();
        break;
      case 2:
        return CovidDataScreen();
        break;
    }
  }
}
