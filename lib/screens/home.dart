import 'package:flutter/material.dart';
import 'package:incite/widgets/app_bar_small.dart';
import 'package:incite/widgets/app_bar_big.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
        appBar: isMobile
            ? AppBarSmall(
                appBar: AppBar(),
              )
            : AppBarBig(
                appBar: AppBar(),
              ));
  }
}
