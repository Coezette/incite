import 'package:flutter/material.dart';

class AppBarSmall extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  AppBarSmall({this.appBar});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/incite-logo.png',
        fit: BoxFit.contain,
        height: 32,
      ),
      centerTitle: true,
    );
  }
}
