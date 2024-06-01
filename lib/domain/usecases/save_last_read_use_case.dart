import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class SaveLastReadUseCase {
  final MuslimRepository _repository;

  SaveLastReadUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required BookmarkEntity lastRead,
  }) async {
    return _repository.saveLastReadRepo(lastRead: lastRead);
  }
}
