import 'package:flutter/material.dart';

class AppBarBig extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  AppBarBig({this.appBar});

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
    );
  }
}
