
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/use_cases/five_days_forecast_use_case.dart';
import 'package:weather_app/features/home/presentation/manager/five_days_forecast_cubit/five_days_forecast_states.dart';

class FiveDaysForecastCubit extends Cubit<FiveDaysForecastStates>{
  final FetchFiveDaysForecastUseCase fetchFiveDaysForecastUseCase;

  FiveDaysForecastCubit(this.fetchFiveDaysForecastUseCase) : super(FiveDaysForecastInitial());


  Future<void>fetchCurrentWeather(String city)async {
    emit(FiveDaysForecastLoading());

    var result=await fetchFiveDaysForecastUseCase.call(city);
    result.fold(
            (l) {
          emit(FiveDaysForecastFailure(l.errorMessage));
        },
            (r) {
          emit(FiveDaysForecastSuccess(r));
        });
  }

}