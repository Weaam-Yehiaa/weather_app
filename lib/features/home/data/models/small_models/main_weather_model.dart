class MainWeatherModel{
  double? temp,feels_like,temp_min,temp_max;
  int? pressure,humidity;

  MainWeatherModel({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity
  });

  factory MainWeatherModel.fromJson(dynamic json) {
    print(json);
    if (json == null) {
      return MainWeatherModel();
    }
    return MainWeatherModel(
      temp: json["temp"],
      feels_like: double.parse(json['feels_like'].toString()),
      temp_min: json["temp_min"],
      temp_max: json["temp_max"],
      pressure: json["pressure"],
      humidity: json["humidity"],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "feels_like": this.feels_like,
      "temp_min": this.temp_min,
      "temp_max": this.temp_max,
      "pressure": this.pressure,
      "humidity": this.humidity,
    };
  }
}