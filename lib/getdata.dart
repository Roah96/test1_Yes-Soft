import 'dart:convert';
import 'dart:async';
import 'coord_model.dart';

import 'package:http/http.dart' as http;

import 'coord_model.dart';
Future<WeatherModel> getData() async {
    String url = 'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22';
    final response =
        await http.get(url, headers: {"Accept": "application/json"});


    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

