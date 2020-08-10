import 'weather_repositry.dart';
import 'coord_model.dart';

class WeatherManager {
  WeatherRepository _repository;

  WeatherManager(this._repository);

  Future<WeatherModel> getWeather() {
    return _repository.getWeather();
  }
}
