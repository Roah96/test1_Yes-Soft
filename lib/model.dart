class Crood{
  double lon;
  double lat;

  Crood({
    this.lon,
    this.lat,
});
factory Crood.fromJson(Map<String, dynamic> json){
  return Crood(
    lat: json['lat'],
    lon: json['lon']
  );
}
}

class Data{
  Crood crood;

  Data({
    this.crood
  });
  factory Data.fromJson(Map<String, dynamic> parsedJson){
  return Data(
    crood: Crood.fromJson(parsedJson['crood']),
  );
}
}
