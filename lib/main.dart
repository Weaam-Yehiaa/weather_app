import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:weather_app/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_app/features/home/domain/use_cases/current_weather_use_case.dart';
import 'package:weather_app/features/home/domain/use_cases/five_days_forecast_use_case.dart';
import 'package:weather_app/features/home/presentation/home_screen.dart';
import 'package:weather_app/features/home/presentation/manager/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manager/five_days_forecast_cubit/five_days_forecast_cubit.dart';
import 'package:weather_app/features/home/presentation/result_screen.dart';
import 'package:weather_app/features/splash/presentation/splash_screen.dart';
import 'package:weather_app/shared/api_services.dart';
import 'package:weather_app/shared/bloc_observer.dart';

void main() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(
        ApiService(Dio())
    ),
  ));
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
//for dependency injection
final getIt=GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
