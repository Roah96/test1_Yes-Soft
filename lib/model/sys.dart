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
