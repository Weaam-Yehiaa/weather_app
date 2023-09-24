import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/five_days_model.dart';

abstract class FiveDaysForecastStates{}

class FiveDaysForecastInitial extends FiveDaysForecastStates{}

class FiveDaysForecastLoading extends FiveDaysForecastStates{}

class FiveDaysForecastSuccess extends FiveDaysForecastStates{
  final List<FiveDaysModel> fiveDaysModelList;

  FiveDaysForecastSuccess(this.fiveDaysModelList);
}
class FiveDaysForecastFailure extends FiveDaysForecastStates{
  final String errMessage;

  FiveDaysForecastFailure(this.errMessage);

}