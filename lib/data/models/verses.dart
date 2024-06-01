import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class VersesModel extends Equatable {
  final int? numberInQuran;
  final int? numberInSurah;
  final String? ayatArab;
  final String? ayatTransliteration;
  final String? ayatId;
  final String? audio;
  final String? tafsir;
  final String? isAudio;

  const VersesModel({
    this.numberInQuran,
    this.numberInSurah,
    this.ayatArab,
    this.ayatTransliteration,
    this.ayatId,
    this.audio,
    this.tafsir,
    this.isAudio,
  });

  factory VersesModel.fromMap(Map<String, dynamic> map) {
    return VersesModel(
      numberInQuran: map['number']['inQuran'],
      numberInSurah: map['number']['inSurah'],
      ayatArab: map['text']['arab'],
      ayatTransliteration: map['text']['transliteration']['en'],
      ayatId: map['translation']['id'],
      audio: map['audio']['primary'] ?? map['audio']['secondary'][0],
      tafsir: map['tafsir']['id']['short'] ?? map['tafsir']['id']['long'],
      isAudio: 'stop',
    );
  }

  VersesEntity toEntity() {
    return VersesEntity(
      numberInQuran: numberInQuran,
      numberInSurah: numberInSurah,
      ayatArab: ayatArab,
      ayatTransliteration: ayatTransliteration,
      ayatId: ayatId,
      audio: audio,
      tafsir: tafsir,
      isAudio: isAudio,
    );
  }

  @override
  List<Object?> get props => [
        numberInQuran,
        numberInSurah,
        ayatArab,
        ayatTransliteration,
        ayatId,
        audio,
        tafsir,
        isAudio,
      ];
}
