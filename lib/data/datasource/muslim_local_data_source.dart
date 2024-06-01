import '../../core/database/app_session.dart';
import '../../core/database/db_helper.dart';
import '../../core/error/exception.dart';
import '../models/models.dart';

abstract class MuslimLocalDataSource {
  Future<List<BookmarkModel>> fetchAllBookmark();
  Future<BookmarkModel> fetchLastRead();
  Future<String> removeBookmark({required BookmarkModel bookmark});
  Future<String> saveBookmark({required BookmarkModel bookmark});
  Future<String> saveLastRead({required BookmarkModel lastRead});
}

class MuslimLocalDataSourceImpl implements MuslimLocalDataSource {
  final DbHelper _dbHelper;
  final AppSession _appSession;

  MuslimLocalDataSourceImpl(this._dbHelper, this._appSession);

  @override
  Future<List<BookmarkModel>> fetchAllBookmark() async {
    try {
      final result = await _dbHelper.getBookmark();
      return result.map((e) => BookmarkModel.fromMap(e)).toList();
    } on CacheException {
      throw CacheException();
    } catch (_) {
      throw GeneralException();
    }
  }

  @override
  Future<BookmarkModel> fetchLastRead() async {
    final result = _appSession.getLastRead();

    if (result == null) throw CacheException();

    return BookmarkModel.fromCacheLastRead(result);
  }

  @override
  Future<String> removeBookmark({required BookmarkModel bookmark}) async {
    try {
      return await _dbHelper.deleteBookmark(bookmark);
    } on CacheException {
      throw CacheException();
    } catch (_) {
      throw GeneralException();
    }
  }

  @override
  Future<String> saveBookmark({required BookmarkModel bookmark}) async {
    try {
      return await _dbHelper.insertBookmark(bookmark);
    } on CacheException {
      throw CacheException();
    } catch (_) {
      throw GeneralException();
    }
  }

  @override
  Future<String> saveLastRead({required BookmarkModel lastRead}) async {
    try {
      return await _appSession.saveLastRead(lastRead.toCacheLastRead());
    } on CacheException {
      throw CacheException();
    } catch (_) {
      throw GeneralException();
    }
  }
}
