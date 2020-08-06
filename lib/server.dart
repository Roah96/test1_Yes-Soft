/*import 'dart:async';

class FakeServer {
  int requestNumber = 0;

  Future<String> getWeather() async {
    await Future.delayed(Duration(seconds: 5));
    int state = (requestNumber) % 3;
    requestNumber++;
    if (state == 0) {
      return '{"lon":-0.13,"lat":51.51}';
    } else if (state == 1) {
      return '{"msg":"Auth error"}';
    } else {
      return '<html> <some>';
    }
  }
}*/

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'coord_model.dart';

class Server{

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