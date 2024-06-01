import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetLastReadUseCase {
  final MuslimRepository _repository;

  GetLastReadUseCase(this._repository);

  Future<Either<Failure, BookmarkEntity>> call() async {
    return _repository.getLastReadRepo();
  }
}
