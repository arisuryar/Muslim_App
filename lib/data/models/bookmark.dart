import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class BookmarkModel extends Equatable {
  final String? id;
  final String? nameArab;
  final String? nameId;
  final int? numberSurah;
  final int? numberAyat;
  final int? indexAyat;
  final DateTime? date;

  const BookmarkModel({
    this.id,
    this.nameArab,
    this.nameId,
    this.numberSurah,
    this.numberAyat,
    this.indexAyat,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_arab': nameArab,
      'name_id': nameId,
      'number_surah': numberSurah,
      'number_ayat': numberAyat,
      'index_ayat': indexAyat,
      'date': date?.toIso8601String(),
    };
  }

  factory BookmarkModel.fromMap(Map<String, dynamic> map) {
    return BookmarkModel(
      id: map['id'],
      nameArab: map['name_arab'],
      nameId: map['name_id'],
      numberSurah: map['number_surah'],
      numberAyat: map['number_ayat'],
      indexAyat: map['index_ayat'],
      date: DateTime.parse(map['date'] as String),
    );
  }

  factory BookmarkModel.fromEntity(BookmarkEntity bookmark) {
    return BookmarkModel(
      id: bookmark.id,
      nameArab: bookmark.nameArab,
      nameId: bookmark.nameId,
      numberSurah: bookmark.numberSurah,
      numberAyat: bookmark.numberAyat,
      indexAyat: bookmark.indexAyat,
      date: bookmark.date,
    );
  }

  factory BookmarkModel.fromCacheLastRead(String source) {
    Map<String, dynamic> map = jsonDecode(source);
    return BookmarkModel(
      nameArab: map['name_arab'],
      nameId: map['name_id'],
      numberSurah: map['number_surah'],
      numberAyat: map['number_ayat'],
      indexAyat: map['index_ayat'],
    );
  }

  String toCacheLastRead() => jsonEncode({
        "name_arab": nameArab,
        "name_id": nameId,
        "number_surah": numberSurah,
        "number_ayat": numberAyat,
        "index_ayat": indexAyat,
      });

  BookmarkEntity toEntity() {
    return BookmarkEntity(
      id: id,
      nameArab: nameArab,
      nameId: nameId,
      numberSurah: numberSurah,
      numberAyat: numberAyat,
      indexAyat: indexAyat,
      date: date,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameArab,
        nameId,
        numberSurah,
        numberAyat,
        indexAyat,
        date,
      ];
}
