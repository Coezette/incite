import 'package:flutter/material.dart';

import '../screens/main_bodies/local_news_screen.dart';

class BottomNavBar extends StatefulWidget {
  int _index;
  Function _updatedIndex;

  BottomNavBar(this._index, this._updatedIndex);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onTap(int currentIndex) {
    setState(() {
      widget._index = currentIndex;
    });
    widget._updatedIndex(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._index,
      onTap: _onTap,
      selectedItemColor: Colors.pink,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          title: Text('Trending'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.not_listed_location),
          title: Text('Local'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.scatter_plot),
          title: Text('Covid-Data'),
        ),
      ],
    );
  }
}
