import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllNiatSholatUseCase {
  final MuslimRepository _repository;

  GetAllNiatSholatUseCase(this._repository);

  Future<Either<Failure, List<NiatSholatEntity>>> call() async {
    return _repository.getAllNiatSholatRepo();
  }
}
