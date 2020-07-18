// TODO: Remove Comments which is not helpful
// TODO: Move this file to a folder named model
class WeatherModel {

  // TODO: I would use https://javiercbk.github.io/json_to_dart/ to generate this

  // TODO: This variables should be public, Dart best practices
  Coord _coord;
  List<Weather> _weather;
  String _base;
  Main _main;
  int _visibility;
  Wind _wind;
  Clouds _clouds;
  int _dt;
  Sys _sys;
  int _id;
  String _name;
  int _cod;

  Coord get coord => _coord;
  List<Weather> get weather => _weather;
  String get base => _base;
  Main get main => _main;
  int get visibility => _visibility;
  Wind get wind => _wind;
  Clouds get clouds => _clouds;
  int get dt => _dt;
  Sys get sys => _sys;
  int get id => _id;
  String get name => _name;
  int get cod => _cod;

  // TODO: Use Map Direct Constructor
  Data({
      Coord coord, 
      List<Weather> weather, 
      String base, 
      Main main, 
      int visibility, 
      Wind wind, 
      Clouds clouds, 
      int dt, 
      Sys sys, 
      int id, 
      String name, 
      int cod}){
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _id = id;
    _name = name;
    _cod = cod;
}

  // TODO: This is risky, use Map<String, dynamic> as the type of the JSON
  Data.fromJson(dynamic json) {
    _coord = json["coord"] != null ? Coord.fromJson(json["coord"]) : null;
    if (json["weather"] != null) {
      _weather = [];
      json["weather"].forEach((v) {
        _weather.add(Weather.fromJson(v));
      });
    }
    _base = json["base"];
    _main = json["main"] != null ? Main.fromJson(json["main"]) : null;
    _visibility = json["visibility"];
    _wind = json["wind"] != null ? Wind.fromJson(json["wind"]) : null;
    _clouds = json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null;
    _dt = json["dt"];
    _sys = json["sys"] != null ? Sys.fromJson(json["sys"]) : null;
    _id = json["id"];
    _name = json["name"];
    _cod = json["cod"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_coord != null) {
      map["coord"] = _coord.toJson();
    }
    if (_weather != null) {
      map["weather"] = _weather.map((v) => v.toJson()).toList();
    }
    map["base"] = _base;
    if (_main != null) {
      map["main"] = _main.toJson();
    }
    map["visibility"] = _visibility;
    if (_wind != null) {
      map["wind"] = _wind.toJson();
    }
    if (_clouds != null) {
      map["clouds"] = _clouds.toJson();
    }
    map["dt"] = _dt;
    if (_sys != null) {
      map["sys"] = _sys.toJson();
    }
    map["id"] = _id;
    map["name"] = _name;
    map["cod"] = _cod;
    return map;
  }

}

class Main {
  double _temp;
  int _pressure;
  int _humidity;
  double _tempMin;
  double _tempMax;

  double get temp => _temp;
  int get pressure => _pressure;
  int get humidity => _humidity;
  double get tempMin => _tempMin;
  double get tempMax => _tempMax;

  Main({
      double temp, 
      int pressure, 
      int humidity, 
      double tempMin, 
      double tempMax}){
    _temp = temp;
    _pressure = pressure;
    _humidity = humidity;
    _tempMin = tempMin;
    _tempMax = tempMax;
}

  Main.fromJson(dynamic json) {
    _temp = json["temp"];
    _pressure = json["pressure"];
    _humidity = json["humidity"];
    _tempMin = json["temp_min"];
    _tempMax = json["temp_max"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["temp"] = _temp;
    map["pressure"] = _pressure;
    map["humidity"] = _humidity;
    map["temp_min"] = _tempMin;
    map["temp_max"] = _tempMax;
    return map;
  }

}

/// id : 300
/// main : "Drizzle"
/// description : "light intensity drizzle"
/// icon : "09d"

class Weather {
  int _id;
  String _main;
  String _description;
  String _icon;

  int get id => _id;
  String get main => _main;
  String get description => _description;
  String get icon => _icon;

  Weather({
      int id, 
      String main, 
      String description, 
      String icon}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json["id"];
    _main = json["main"];
    _description = json["description"];
    _icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["main"] = _main;
    map["description"] = _description;
    map["icon"] = _icon;
    return map;
  }

}

/// lon : -0.13
/// lat : 51.51

class Coord {
  double _lon;
  double _lat;

  double get lon => _lon;
  double get lat => _lat;

  Coord({
      double lon, 
      double lat}){
    _lon = lon;
    _lat = lat;
}

  Coord.fromJson(dynamic json) {
    _lon = json["lon"];
    _lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lon"] = _lon;
    map["lat"] = _lat;
    return map;
  }

}