import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllBacaanSholatUseCase {
  final MuslimRepository _repository;

  GetAllBacaanSholatUseCase(this._repository);

  Future<Either<Failure, List<BacaanSholatEntity>>> call() async {
    return _repository.getAllBacaanSholatRepo();
  }
}
