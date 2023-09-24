import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/domain/repos/home_repo.dart';

import '../../../../shared/errors/failures.dart';
import '../../data/models/five_days_model.dart';
//kda b2olo ana hab3tlk type est3mlo gwa w param
abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> call([Param ]);
}
class FetchFiveDaysForecastUseCase extends UseCase<List<FiveDaysModel>,List>{
  final HomeRepo homeRepo;

  FetchFiveDaysForecastUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<FiveDaysModel>>> call([city]) {
    return homeRepo.getFiveDaysForecast(city);
  }

}
