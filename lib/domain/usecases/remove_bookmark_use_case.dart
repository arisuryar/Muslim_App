import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class RemoveBookmarkUseCase {
  final MuslimRepository _repository;

  RemoveBookmarkUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required BookmarkEntity bookmark,
  }) async {
    return _repository.removeBookmarkRepo(bookmark: bookmark);
  }
}
