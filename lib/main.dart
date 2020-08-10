import 'package:flutter/material.dart';
import 'package:patterns_app/home.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  HomeScreen _homeScreen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Patterns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _homeScreen,
    );
  }
}
