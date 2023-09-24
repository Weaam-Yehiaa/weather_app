import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/five_days_model.dart';

import '../../../../shared/api_services.dart';
import '../../../../shared/constants.dart';

abstract class HomeRemoteDataSource{
  Future<CurrentWeatherModel>fetchCurrentWeather(String city);
  Future<List<FiveDaysModel>>fetchFiveDaysForecast(String city);
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<CurrentWeatherModel> fetchCurrentWeather(String city) async {
    var data= await apiService.get(url: '$kCurrentBaseUrl/weather?q=$city&lang=en&$kApiKey' );
    return CurrentWeatherModel.fromJson(data);

  }

  @override
  Future<List<FiveDaysModel>> fetchFiveDaysForecast(String city) async {
    var data= await apiService.get(url: '$kFiveDaysBaseUrl/forecast?q=$city&lang=en&$kApiKey' );
    print(data);
    print('*******************');
    return
        (data['list'] as List)
            ?.map((t) => FiveDaysModel.fromJson(t))
            ?.toList()??
            List.empty();
  }

}