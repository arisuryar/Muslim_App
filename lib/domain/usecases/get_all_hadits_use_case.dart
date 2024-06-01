import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllHaditsUseCase {
  final MuslimRepository _repository;

  GetAllHaditsUseCase(this._repository);

  Future<Either<Failure, List<HaditsEntity>>> call() async {
    return _repository.getAllHaditsRepo();
  }
}
