import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/muslim_repository.dart';
import '../datasource/muslim_local_data_source.dart';
import '../datasource/muslim_remote_data_source.dart';
import '../models/models.dart';

class MuslimRepositoryImpl implements MuslimRepository {
  final MuslimLocalDataSource _localDataSource;
  final MuslimRemoteDataSource _remoteDataSource;

  MuslimRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<BacaanSholatEntity>>>
      getAllBacaanSholatRepo() async {
    try {
      final result = await _remoteDataSource.fetchAllBacaanSholat();
      return Right(result.map((model) => model.toEntity()).toList());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarkRepo() async {
    try {
      final result = await _localDataSource.fetchAllBookmark();
      return Right(result.map((model) => model.toEntity()).toList());
    } on CacheException {
      return const Left(CacheFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<DoaEntity>>> getAllDoaRepo() async {
    try {
      final result = await _remoteDataSource.fetchAllDoa();
      return Right(result.map((model) => model.toEntity()).toList());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<HaditsEntity>>> getAllHaditsRepo() async {
    try {
      final result = await _remoteDataSource.fetchAllHadits();
      return Right(result.map((model) => model.toEntity()).toList());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<NiatSholatEntity>>> getAllNiatSholatRepo() async {
    try {
      final result = await _remoteDataSource.fetchAllNiatSholat();
      return Right(result.map((model) => model.toEntity()).toList());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<SurahEntity>>> getAllSurahRepo() async {
    try {
      final result = await _remoteDataSource.fetchAllSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, SurahEntity>> getDetailSurahRepo({
    required int id,
  }) async {
    try {
      final result = await _remoteDataSource.fetchDetailSurah(id: id);
      return Right(result.toEntity());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, BookmarkEntity>> getLastReadRepo() async {
    try {
      final result = await _localDataSource.fetchLastRead();
      return Right(result.toEntity());
    } on CacheException {
      return const Left(CacheFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, SholatEntity>> getSholatRepo({
    required LocationEntity location,
  }) async {
    try {
      final result = await _remoteDataSource.fetchSholat(location: location);
      return Right(result.toEntity());
    } on NotFoundException {
      return const Left(NotFoundFailure(''));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, String>> removeBookmarkRepo({
    required BookmarkEntity bookmark,
  }) async {
    try {
      final result = await _localDataSource.removeBookmark(
        bookmark: BookmarkModel.fromEntity(bookmark),
      );
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, String>> saveBookmarkRepo({
    required BookmarkEntity bookmark,
  }) async {
    try {
      final result = await _localDataSource.saveBookmark(
        bookmark: BookmarkModel.fromEntity(bookmark),
      );
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }

  @override
  Future<Either<Failure, String>> saveLastReadRepo({
    required BookmarkEntity lastRead,
  }) async {
    try {
      final result = await _localDataSource.saveLastRead(
        lastRead: BookmarkModel.fromEntity(lastRead),
      );
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure(''));
    } on GeneralException {
      return const Left(GeneralFailure(''));
    }
  }
}
