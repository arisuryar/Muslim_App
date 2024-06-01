import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';
import 'verses.dart';

class SurahModel extends Equatable {
  final int? numberSurah;
  final int? numberAyat;
  final String? nameArab;
  final String? nameId;
  final String? nameTranslation;
  final String? revelation;
  final String? tafsir;
  final List<VersesModel>? verses;

  const SurahModel({
    this.numberSurah,
    this.numberAyat,
    this.nameArab,
    this.nameId,
    this.nameTranslation,
    this.revelation,
    this.tafsir,
    this.verses,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      numberSurah: json['number'],
      numberAyat: json['numberOfVerses'],
      nameArab: json['name']['short'],
      nameId: json['name']['transliteration']['id'],
      nameTranslation: json['name']['translation']['id'],
      revelation: json['revelation']['id'],
      tafsir: json['tafsir']['id'],
      verses: json['verses'] != null
          ? List<VersesModel>.from(
              (json['verses'] as List).map(
                (ayat) => VersesModel.fromMap(ayat as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  SurahEntity toEntity() {
    return SurahEntity(
      numberSurah: numberSurah,
      numberAyat: numberAyat,
      nameArab: nameArab,
      nameId: nameId,
      nameTranslation: nameTranslation,
      revelation: revelation,
      tafsir: tafsir,
      verses: verses?.map((ayat) => ayat.toEntity()).toList(),
    );
  }

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
