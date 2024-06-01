import 'package:equatable/equatable.dart';

class VersesEntity extends Equatable {
  final int? numberInQuran;
  final int? numberInSurah;
  final String? ayatArab;
  final String? ayatTransliteration;
  final String? ayatId;
  final String? audio;
  final String? tafsir;
  final String? isAudio;

  const VersesEntity({
    this.numberInQuran,
    this.numberInSurah,
    this.ayatArab,
    this.ayatTransliteration,
    this.ayatId,
    this.audio,
    this.tafsir,
    this.isAudio,
  });

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
