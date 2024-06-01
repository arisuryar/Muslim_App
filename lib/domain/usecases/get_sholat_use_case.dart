import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetSholatUseCase {
  final MuslimRepository _repository;

  GetSholatUseCase(this._repository);

  Future<Either<Failure, SholatEntity>> call({
    required LocationEntity location,
  }) async {
    return _repository.getSholatRepo(location: location);
  }
}
