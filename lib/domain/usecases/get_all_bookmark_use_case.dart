import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetAllBookmarkUseCase {
  final MuslimRepository _repository;

  GetAllBookmarkUseCase(this._repository);

  Future<Either<Failure, List<BookmarkEntity>>> call() async {
    return _repository.getAllBookmarkRepo();
  }
}
