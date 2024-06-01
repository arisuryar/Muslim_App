import 'package:equatable/equatable.dart';

import 'verses.dart';

class SurahEntity extends Equatable {
  final int? numberSurah;
  final int? numberAyat;
  final String? nameArab;
  final String? nameId;
  final String? nameTranslation;
  final String? revelation;
  final String? tafsir;
  final List<VersesEntity>? verses;

  const SurahEntity({
    this.numberSurah,
    this.numberAyat,
    this.nameArab,
    this.nameId,
    this.nameTranslation,
    this.revelation,
    this.tafsir,
    this.verses,
  });

  @override
  List<Object?> get props => [
        numberSurah,
        numberAyat,
        nameArab,
        nameId,
        nameTranslation,
        revelation,
        tafsir,
        verses,
      ];
}
