/// coord : {"lon":-0.13,"lat":51.51}
/// weather : [{"id":300,"main":"Drizzle","description":"light intensity drizzle","icon":"09d"}]
/// base : "stations"
/// main : {"temp":280.32,"pressure":1012,"humidity":81,"temp_min":279.15,"temp_max":281.15}
/// visibility : 10000
/// wind : {"speed":4.1,"deg":80}
/// clouds : {"all":90}
/// dt : 1485789600
/// sys : {"type":1,"id":5091,"message":0.0103,"country":"GB","sunrise":1485762037,"sunset":1485794875}
/// id : 2643743
/// name : "London"
/// cod : 200

class Data {
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

/// type : 1
/// id : 5091
/// message : 0.0103
/// country : "GB"
/// sunrise : 1485762037
/// sunset : 1485794875

class Sys {
  int _type;
  int _id;
  double _message;
  String _country;
  int _sunrise;
  int _sunset;

  int get type => _type;
  int get id => _id;
  double get message => _message;
  String get country => _country;
  int get sunrise => _sunrise;
  int get sunset => _sunset;

  Sys({
      int type, 
      int id, 
      double message, 
      String country, 
      int sunrise, 
      int sunset}){
    _type = type;
    _id = id;
    _message = message;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
}

  Sys.fromJson(dynamic json) {
    _type = json["type"];
    _id = json["id"];
    _message = json["message"];
    _country = json["country"];
    _sunrise = json["sunrise"];
    _sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["id"] = _id;
    map["message"] = _message;
    map["country"] = _country;
    map["sunrise"] = _sunrise;
    map["sunset"] = _sunset;
    return map;
  }

}

/// all : 90

class Clouds {
  int _all;

  int get all => _all;

  Clouds({
      int all}){
    _all = all;
}

  Clouds.fromJson(dynamic json) {
    _all = json["all"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["all"] = _all;
    return map;
  }

}

/// speed : 4.1
/// deg : 80

class Wind {
  double _speed;
  int _deg;

  double get speed => _speed;
  int get deg => _deg;

  Wind({
      double speed, 
      int deg}){
    _speed = speed;
    _deg = deg;
}

  Wind.fromJson(dynamic json) {
    _speed = json["speed"];
    _deg = json["deg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["speed"] = _speed;
    map["deg"] = _deg;
    return map;
  }

}

/// temp : 280.32
/// pressure : 1012
/// humidity : 81
/// temp_min : 279.15
/// temp_max : 281.15

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