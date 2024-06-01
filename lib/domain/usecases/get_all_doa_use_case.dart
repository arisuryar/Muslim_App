import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllDoaUseCase {
  final MuslimRepository _repository;

  GetAllDoaUseCase(this._repository);

  Future<Either<Failure, List<DoaEntity>>> call() async {
    return _repository.getAllDoaRepo();
  }
}
