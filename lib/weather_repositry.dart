import 'dart:convert';

import 'package:http/http.dart';
import 'api_routes.dart';
import 'coord_model.dart';

class WeatherRepository {
  Client _httpClient;

  WeatherRepository() {
    _httpClient = new Client();
  }

  Future<WeatherModel> getWeather() async {
    Response response = await _httpClient.get(ApiRoutes.BASE_URL);

    if (response.statusCode >= 200 && response.statusCode < 400) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else
      return null;
  }
}