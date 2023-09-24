

import 'package:intl/intl.dart';
import 'package:weather_app/features/home/data/models/small_models/clouds_model.dart';
import 'package:weather_app/features/home/data/models/small_models/coord_model.dart';
import 'package:weather_app/features/home/data/models/small_models/main_weather_model.dart';
import 'package:weather_app/features/home/data/models/small_models/sys_model.dart';
import 'package:weather_app/features/home/data/models/small_models/weather_model.dart';
import 'package:weather_app/features/home/data/models/small_models/wind_model.dart';

class CurrentWeatherModel{
  CoordModel? coord;
  List<WeatherModel>?weather;
  String? base;
  MainWeatherModel? main;
  int? visibility;
  CloudsModel? clouds;
  WindModel? wind;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  int? cod;
  String? name;

  CurrentWeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.clouds,
    this.wind,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.cod,
    this.name
});

  factory CurrentWeatherModel.fromJson(dynamic json) {

    if (json == null) {

      return CurrentWeatherModel();
    }
    return CurrentWeatherModel(
      coord: CoordModel.fromJson(json["coord"]),
      weather: (json["weather"] as List)
          .map((i) => WeatherModel.fromJson(i))
          .toList(),
      base: json["base"],
      main: MainWeatherModel.fromJson(json["main"]),
      visibility: json["visibility"],
      clouds: CloudsModel.fromJson(json["clouds"]),
      wind: WindModel.fromJson(json["wind"]),
      dt: json["dt"],
      sys: SysModel.fromJson(json["sys"]),
      timezone:json["timezone"],
      id: json["id"],
      cod: json["cod"],
      name: json["name"],
    );
  }

}