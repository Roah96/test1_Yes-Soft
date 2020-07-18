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
