import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class SaveBookmarkUseCase {
  final MuslimRepository _repository;

  SaveBookmarkUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required BookmarkEntity bookmark,
  }) async {
    return _repository.saveBookmarkRepo(bookmark: bookmark);
  }
}
