import 'package:flutter/material.dart';
import 'ui/screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // MyApp({Key key, this.quote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather in London',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // TODO: Use routes + the start route instead of home.
      home: MainScreen()
    );
  }
}
