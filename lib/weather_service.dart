import 'manager.dart';
import 'coord_model.dart';
import 'shared_prefs.dart';

class WeatherService {

  WeatherManager _weatherManager;
  SharedPreferencesHelper _preferencesHelper;

  WeatherService(this._preferencesHelper, this._weatherManager);

  Future<WeatherModel> getWeather() async {
    WeatherModel dataFromLocal =  await _getWeatherFromLocal();

    if (dataFromLocal == null) {
      WeatherModel dataFromNetwork = await _getWeatherFromNetwork();
      _preferencesHelper.setWeather(getWeatherModel(dataFromNetwork));
      return getWeatherModel(dataFromNetwork);
    } else {
      return dataFromLocal;
    }
  }

  getWeatherModel(WeatherModel response) {
  }

  Future<WeatherModel> refreshWeather() {
    dynamic data = _getWeatherFromNetwork();
    _preferencesHelper.setWeather(data);
    return data;
  }

  Future<WeatherModel> _getWeatherFromNetwork() {
    return _weatherManager.getWeather();
  }

  Future<WeatherModel> _getWeatherFromLocal() {
    return _preferencesHelper.getWeather();
  }
}