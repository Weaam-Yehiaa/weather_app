import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/domain/repos/home_repo.dart';

import '../../../../shared/errors/failures.dart';
//kda b2olo ana hab3tlk type est3mlo gwa w param
abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> call([Param ]);
}
class FetchCurrentWeatherUseCase extends UseCase<CurrentWeatherModel,String>{
  final HomeRepo homeRepo;

  FetchCurrentWeatherUseCase(this.homeRepo);

  @override
  Future<Either<Failure, CurrentWeatherModel>> call([city]) {
    return homeRepo.getCurrentWeather(city);
  }

}
