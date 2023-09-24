import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/result_screen_impl.dart';

import '../../../main.dart';
import '../data/repos/home_repo_impl.dart';
import '../domain/use_cases/current_weather_use_case.dart';
import '../domain/use_cases/five_days_forecast_use_case.dart';
import 'manager/current_weather_cubit/current_weather_cubit.dart';
import 'manager/five_days_forecast_cubit/five_days_forecast_cubit.dart';

class ResultScreen extends StatelessWidget {
  String city;

  ResultScreen(this.city);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return CurrentWeatherCubit(FetchCurrentWeatherUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
            )..fetchCurrentWeather(city);
          }),
          BlocProvider(create: (context) {
            return FiveDaysForecastCubit(FetchFiveDaysForecastUseCase(
              getIt.get<HomeRepoImpl>(),
            )
            )..fetchCurrentWeather(city);
          }),
        ],
        child: ResultScreenImpl()
    );
  }
}
