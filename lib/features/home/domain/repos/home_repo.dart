import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/shared/errors/failures.dart';

import '../../data/models/five_days_model.dart';

abstract class HomeRepo{
Future<Either<Failure,CurrentWeatherModel>>getCurrentWeather(String city);
Future<Either<Failure,List<FiveDaysModel>>>getFiveDaysForecast(String city);
}