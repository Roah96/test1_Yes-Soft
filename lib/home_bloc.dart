import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:patterns_app/coord_model.dart';
import 'package:patterns_app/server.dart';
import 'package:rxdart/rxdart.dart';

import 'server.dart';
class HomeBloc {
  static const int STATUS_CODE_INIT = 784;
  static const int STATUS_CODE_SUCCESS = 785;
  static const int STATUS_CODE_ERROR = 786;
  static const int STATUS_CODE_LOADING = 787;

  static const String KEY_STATUS = 'status';
  static const String KEY_PAYLOAD = 'payload';

  Server _server;

  HomeBloc() {
    _server = new Server();
  }

  PublishSubject<Map<String, dynamic>> _stateSubject = new PublishSubject();

  Stream<Map<String, dynamic>> get stateStream => _stateSubject.stream;

  getWeather() {
    _stateSubject.add({KEY_STATUS: STATUS_CODE_LOADING});
    _server.getData().then((value) async{
      try {
        final result = await InternetAddress.lookup('google.com');
       // WeatherModel model = WeatherModel.fromJson(jsonDecode(value.toString()));
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          _stateSubject
              .add({KEY_STATUS: STATUS_CODE_SUCCESS,/* KEY_PAYLOAD: model*/});
        } else {
          _stateSubject.add({KEY_STATUS: STATUS_CODE_ERROR});
        }
      } catch (e) {
        _stateSubject.add({KEY_STATUS: STATUS_CODE_ERROR});
      }
    });
  }

  dispose() {
    _stateSubject.close();
  }
}
