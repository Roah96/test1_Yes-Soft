import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather in London',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Weather in London'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Text(
              'coord', style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('Lat:51:51', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('|', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('Lng:-0.13', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
              ],

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
              'Main', style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
                Text('Tempreture: 280.32', style: TextStyle(
                 fontSize: 12,
                 color: Colors.black45, 
                ),),
                Text('Pressure: 1012', style: TextStyle(
                 fontSize: 12,
                 color: Colors.black45, 
                ),),
                Text('Humidity : 81', style: TextStyle(
                 fontSize: 12,
                 color: Colors.black45, 
                ),),
                Text('Highest tempreture: 281.51', style: TextStyle(
                 fontSize: 12,
                 color: Colors.black45, 
                ),),
                Text('Lowest tempreture: 279.15 ', style: TextStyle(
                 fontSize: 12,
                 color: Colors.black45, 
                ),),
              ],
            ), 
            SizedBox(
              height: 20,
            ),
            Text(
              'Wind', style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('Speed:4.1', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('|', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('degree: 80', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                ],
            ),
            SizedBox(
              height: 20,
            ),
                Text(
              'Sys', style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
              SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('Sunrise: 09:40:37', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('|', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
                SizedBox(
                  width: 50,
                ),
                Text('Sunset: 06:47:55', style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey, 
                ),),
              ],

            ),
              ],
            ),
         
        ),
      
      );
     
    
  }
}
