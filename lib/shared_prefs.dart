import 'coord_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _KEY_WEATHER = 'weather';

  Future<void> setWeather(WeatherModel weatherModel) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(_KEY_WEATHER, weatherModel.toString());
  }

  Future<WeatherModel> getWeather() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    WeatherModel model = new WeatherModel.jsonDecode(_sharedPreferences.getString(_KEY_WEATHER));
    return model;
  }

}