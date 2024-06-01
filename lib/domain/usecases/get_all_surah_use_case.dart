import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllSurahUseCase {
  final MuslimRepository _repository;

  GetAllSurahUseCase(this._repository);

  Future<Either<Failure, List<SurahEntity>>> call() async {
    return _repository.getAllSurahRepo();
  }
}
