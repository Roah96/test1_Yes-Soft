import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patterns_app/coord_model.dart';
import 'coord_model.dart';
import 'getdata.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc bloc = new HomeBloc();

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

// Home Page State:
class _HomeScreenState extends State<HomeScreen> {
  int currentState = HomeBloc.STATUS_CODE_INIT;
  WeatherModel payload;

  @override
  Widget build(BuildContext context) {
    widget.bloc.stateStream.listen((event) {
      currentState = event[HomeBloc.KEY_STATUS];

      if (currentState == HomeBloc.STATUS_CODE_SUCCESS) {
        payload = event[HomeBloc.KEY_PAYLOAD];
      }

      setState(() {});
    });

    switch (currentState) {
      case HomeBloc.STATUS_CODE_INIT:
        widget.bloc.getWeather();
        return drawLoadingScreen();
      case HomeBloc.STATUS_CODE_LOADING:
        return drawLoadingScreen();
      case HomeBloc.STATUS_CODE_SUCCESS:
        return drawSuccessScreen();
      default:
        return drawErrorScreen();
    }
  }

  Scaffold drawSuccessScreen() {
    return Scaffold(
      body: Center(
              child: FutureBuilder<WeatherModel>(
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
                        width: 40,
                      ),
                      Text('Sunset: ' + snapshot.data.sys.sunset.toString(), style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey, 
                      ),),
                    ],

                  ),
                  _reloadButton()
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
          )
    );
  }

  Scaffold drawErrorScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Error Loading Data'),
            _reloadButton()
          ],
        ),
      ),
    );
  }

  Scaffold drawLoadingScreen() {
    return Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }

  RaisedButton _reloadButton() {
    return RaisedButton(
      onPressed: () {
        widget.bloc.getWeather();
      },
      child: Text('Refresh'),
    );
  }
}
