import 'package:flutter/material.dart';

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
      selectedItemColor: Colors.green,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          title: Text('Trending'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
