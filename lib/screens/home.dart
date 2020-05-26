import 'package:flutter/material.dart';

import '../widgets/body.dart';
import '../widgets/app_bar_small.dart';
import '../widgets/app_bar_big.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    void _indexUpdate(int newIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
    }

    return Scaffold(
      appBar: isMobile
          ? AppBarSmall(appBar: AppBar())
          : AppBarBig(appBar: AppBar()),
      body: Body(
        selectedIndex,
        _indexUpdate,
        isMobile: isMobile,
      ),
      bottomNavigationBar:
          isMobile ? BottomNavBar(selectedIndex, _indexUpdate) : null,
    );
  }
}
