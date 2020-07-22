import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/ui/widget/weather_divider.dart';
import '../widget/weather_row.dart';
import '../../model/weather_model.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
            title:Text(
              'Weather in London'
              ),
              ),
          body: RefreshIndicator(
        child: ListView( 
          children: <Widget>[
            ListTile(
              title: Center(
          // TODO: Will change this later
            child: FutureBuilder<WeatherModel>(
              future: getData(),
              builder: (context, snapshot) {
              if (snapshot.hasData) {
                //checks if the response returns valid data
                return Center(
                  child: Column(
                    children: <Widget>[
                      WeatherDivider(),
                      WeatherRow(
                        header: 'Coord',
                        key1: "Hello",
                        value1: "123",
                        key2: "Again",
                        value2: "345",
                      ),
                      WeatherDivider(),
                      Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Main',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Tempreture: ' + snapshot.data.main.temp.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Pressure: ' + snapshot.data.main.pressure.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Humidity : ' +
                                snapshot.data.main.humidity.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Highest tempreture: ' +
                                snapshot.data.main.tempMax.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Lowest tempreture:  ' +
                                snapshot.data.main.tempMin.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      WeatherDivider(),
                      WeatherRow(
                        header: 'Coord',
                        key1: "Hello",
                        value1: "123",
                        key2: "Again",
                        value2: "345",
                      ),
                      WeatherDivider(),
                      WeatherRow(
                        header: 'Coord',
                        key1: "Hello",
                        value1: "123",
                        key2: "Again",
                        value2: "345",
                      ),
                    ],
                  ),
                );

                // TODO: Move this to the Class top
              } else if (snapshot.hasError) {
                //checks if the response throws an error
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
              ),
            ),
          ],
        ),
        onRefresh: () async {
          Completer<Null> completer = new Completer<Null>();
          await Future.delayed(Duration(seconds: 3)).then((onvalue) {
            completer.complete();
            setState(() {
              
            });
          });
          return completer.future;
        },
        ),
    );

  }

  // TODO: Name Functions Meaningfully, And Move this to a separate class
  Future<WeatherModel> getData() async {
    String url =
        'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22';
    final response =
        await http.get(url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
