import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/entities.dart';

abstract class MuslimRepository {
  // Quran
  Future<Either<Failure, List<SurahEntity>>> getAllSurahRepo();
  Future<Either<Failure, SurahEntity>> getDetailSurahRepo({
    required int id,
  });

  // Bookmark
  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarkRepo();
  Future<Either<Failure, String>> saveBookmarkRepo({
    required BookmarkEntity bookmark,
  });
  Future<Either<Failure, String>> removeBookmarkRepo({
    required BookmarkEntity bookmark,
  });

  // Last Read
  Future<Either<Failure, BookmarkEntity>> getLastReadRepo();
  Future<Either<Failure, String>> saveLastReadRepo({
    required BookmarkEntity lastRead,
  });

  // Doa
  Future<Either<Failure, List<DoaEntity>>> getAllDoaRepo();

  // Hadits
  Future<Either<Failure, List<HaditsEntity>>> getAllHaditsRepo();

  // Sholat
  Future<Either<Failure, SholatEntity>> getSholatRepo({
    required LocationEntity location,
  });
  Future<Either<Failure, List<NiatSholatEntity>>> getAllNiatSholatRepo();
  Future<Either<Failure, List<BacaanSholatEntity>>> getAllBacaanSholatRepo();
}
