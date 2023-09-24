import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/five_days_model.dart';
import 'package:weather_app/features/home/domain/repos/home_repo.dart';
import 'package:weather_app/shared/api_services.dart';
import 'package:weather_app/shared/constants.dart';
import 'package:weather_app/shared/errors/failures.dart';

import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource
});


  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(String city) async {
  try{
   // var data= await apiService.get(url: '$kCurrentBaseUrl/weather?q=$city&lang=en&$kApiKey' );
    var data=await homeRemoteDataSource.fetchCurrentWeather(city);
    return right(data);

  }catch(e){
    if(e is DioException){
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure,List<FiveDaysModel>>> getFiveDaysForecast(String city) async {
    try{
     // var data= await apiService.get(url: '$kFiveDaysBaseUrl/forecast?q=$city&lang=en&$kApiKey' );
    var data=await homeRemoteDataSource.fetchFiveDaysForecast(city);
      return right(data);

    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}