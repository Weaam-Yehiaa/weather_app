import 'package:weather_app/features/home/data/models/current_weather_model.dart';

abstract class CurrentWeatherStates{}

class CurrentWeatherInitial extends CurrentWeatherStates{}

class CurrentWeatherLoading extends CurrentWeatherStates{}

class CurrentWeatherSuccess extends CurrentWeatherStates{
  final CurrentWeatherModel currentWeatherModel;

  CurrentWeatherSuccess(this.currentWeatherModel);
}
class CurrentWeatherFailure extends CurrentWeatherStates{
  final String errMessage;

  CurrentWeatherFailure(this.errMessage);

}