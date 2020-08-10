import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:patterns_app/coord_model.dart';
import 'package:patterns_app/server.dart';
import 'package:rxdart/rxdart.dart';
import 'weather_service.dart';

import 'server.dart';
class HomeBloc {
  static const int STATUS_CODE_INIT = 784;
  static const int STATUS_CODE_SUCCESS = 785;
  static const int STATUS_CODE_ERROR = 786;
  static const int STATUS_CODE_LOADING = 787;

  static const String KEY_STATUS = 'status';
  static const String KEY_PAYLOAD = 'payload';

  //Server _server;

  WeatherService _weatherService;

  /*HomeBloc() {
    _server = new Server();
  }*/
  HomeBloc (this._weatherService);

  PublishSubject<Map<String, dynamic>> _stateSubject = new PublishSubject();

  Stream<Map<String, dynamic>> get stateStream => _stateSubject.stream;

  getWeather() {
    _stateSubject.add({KEY_STATUS: STATUS_CODE_LOADING});

    _weatherService.getWeather().then((weatherModel) {
      if (weatherModel == null) {
        _stateSubject.add({KEY_STATUS: STATUS_CODE_ERROR});
      } else {
        _stateSubject.add(
            {KEY_STATUS: STATUS_CODE_SUCCESS, KEY_PAYLOAD: weatherModel});
      }
    });
  }

   refreshWeather() {
    _stateSubject.add({KEY_STATUS: STATUS_CODE_LOADING});

    _weatherService.refreshWeather().then((weatherModel) {
      if (weatherModel == null) {
        _stateSubject.add({KEY_STATUS: STATUS_CODE_ERROR});
      } else {
        _stateSubject.add(
            {KEY_STATUS: STATUS_CODE_SUCCESS, KEY_PAYLOAD: weatherModel});
      }
    });
  }
}
