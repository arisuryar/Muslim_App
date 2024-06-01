import 'dart:io';

import 'package:muslim_app/core/error/exception.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/models/models.dart';

class DbHelper {
  // Database Name and Version
  static const String _databaseName = 'muslim.db';
  static const int _versionDb = 1;

  // Bookmark Table
  final String _tableBookmark = 'bookmark';
  final String _id = 'id';
  final String _nameArab = 'name_arab';
  final String _nameId = 'name_id';
  final String _numberSurah = 'number_surah';
  final String _numberAyat = 'number_ayat';
  final String _indexAyat = 'index_ayat';
  final String _date = 'date';

  DbHelper._private();

  static final DbHelper instance = DbHelper._private();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  // Init database
  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();

    String path = join(dir.path, _databaseName);

    return await openDatabase(
      path,
      version: _versionDb,
      onCreate: _onCreate,
    );
  }

  // Create Table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $_tableBookmark (
        $_id TEXT PRIMARY KEY,
        $_nameArab TEXT NOT NULL,
        $_nameId TEXT NOT NULL,
        $_numberSurah INTEGER NOT NULL,
        $_numberAyat INTEGER NOT NULL,
        $_indexAyat INTEGER NOT NULL,
        $_date TEXT NOT NULL
      )
      ''',
    );
  }

  // Insert atau Add Bookmark
  Future<String> insertBookmark(BookmarkModel bookmark) async {
    try {
      final db = await database;

      final datas = await db.query(
        _tableBookmark,
        where: '''
      $_nameArab = ? AND
      $_nameId = ? AND
      $_numberSurah = ? AND
      $_numberAyat = ? AND
      $_indexAyat = ?
      ''',
        whereArgs: [
          bookmark.nameArab,
          bookmark.nameId,
          bookmark.numberSurah,
          bookmark.numberAyat,
          bookmark.indexAyat
        ],
      );

      if (datas.isNotEmpty) return 'Bookmark sudah ada';

      await db.insert(_tableBookmark, bookmark.toMap());

      return 'Bookmark berhasil ditambahkan';
    } catch (_) {
      throw CacheException();
    }
  }

  // Delete atau Remove Bookmark
  Future<String> deleteBookmark(BookmarkModel bookmark) async {
    try {
      final db = await database;

      await db.delete(
        _tableBookmark,
        where: '$_id = ?',
        whereArgs: [bookmark.id],
      );

      return 'Bookmark berhasil dihapus';
    } catch (_) {
      throw CacheException();
    }
  }

  // Get atau Ambil data Bookmark
  Future<List<Map<String, Object?>>> getBookmark() async {
    try {
      final db = await database;

      return await db.query(_tableBookmark, orderBy: '$_date DESC');
    } catch (_) {
      throw CacheException();
    }
  }
}
