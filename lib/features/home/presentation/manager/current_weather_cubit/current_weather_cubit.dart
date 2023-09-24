import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/use_cases/current_weather_use_case.dart';
import 'package:weather_app/features/home/presentation/manager/current_weather_cubit/currentweather_states.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherStates>{
  final FetchCurrentWeatherUseCase fetchCurrentWeatherUseCase;

  CurrentWeatherCubit(this.fetchCurrentWeatherUseCase) : super(CurrentWeatherInitial());


  Future<void>fetchCurrentWeather(String city)async {
    emit(CurrentWeatherLoading());

    var result=await fetchCurrentWeatherUseCase.call(city);
    result.fold(
            (l) {
              emit(CurrentWeatherFailure(l.errorMessage));
            },
            (r) {
              emit(CurrentWeatherSuccess(r));
            });
  }

}