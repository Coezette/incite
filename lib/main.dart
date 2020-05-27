import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/main_bodies/local_news_screen.dart';
import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'incite',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomePage(),
        LocalNewsScreen.routeName: (ctx) => LocalNewsScreen(),
      },
    );
  }
}
