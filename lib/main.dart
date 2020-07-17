import 'dart:async';
import 'dart:convert';
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather in London'),
        ),
        body: Center(
          child: FutureBuilder<Data>(
            future: getData(), //sets the getQuote method as the expected Future
            builder: (context, snapshot) {
              if (snapshot.hasData) { //checks if the response returns valid data              
                return Center(
                  child: Column(
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
                        Text('Lat: '+ snapshot.data.coord.lat.toString(), style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey, 
                          ),),
                        
                         //displays the quote
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
                        Text('Lng: ' + snapshot.data.coord.lon.toString() , style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey, 
                        ),),
                        ],
                      ),
                      SizedBox(
                          height: 20,
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
                        
                    Text('Tempreture: ' + snapshot.data.main.temp.toString() , style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45, 
                    ),),
                    Text('Pressure: '+ snapshot.data.main.pressure.toString(), style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45, 
                    ),),
                    Text('Humidity : '+  snapshot.data.main.humidity.toString() , style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45, 
                    ),),
                    Text('Highest tempreture: ' + snapshot.data.main.tempMax.toString(), style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45, 
                    ),),
                    Text('Lowest tempreture:  ' + snapshot.data.main.tempMin.toString(), style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45, 
                    ),),
                    
                   SizedBox(
                    height: 20,
                      ),
                    Text('Wind', style: TextStyle(
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
                    Text('Speed: ' + snapshot.data.wind.speed.toString(), style: TextStyle(
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
                    Text('degree: ' + snapshot.data.wind.deg.toString(), style: TextStyle(
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
                    Text('Sunrise: ' + snapshot.data.sys.sunrise.toString(), style: TextStyle(
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
                    Text('Sunset: ' + snapshot.data.sys.sunset.toString(), style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey, 
                    ),),
                  ],

                ),
                          ],
                        ), 
                          SizedBox(
                            height: 20,
                          ), //displays the quote's author
                        ],
                      ),
                );
              } else if (snapshot.hasError) { //checks if the response throws an error
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }


  Future<Data> getData() async {
    String url = 'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22';
    final response =
        await http.get(url, headers: {"Accept": "application/json"});


    if (response.statusCode == 200) {
      return Data.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
