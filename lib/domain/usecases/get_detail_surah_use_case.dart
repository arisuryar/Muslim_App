import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';
import '../repositories/muslim_repository.dart';

class GetDetailSurahUseCase {
  final MuslimRepository _repository;

  GetDetailSurahUseCase(this._repository);

  Future<Either<Failure, SurahEntity>> call({required int id}) async {
    return _repository.getDetailSurahRepo(id: id);
  }
}
