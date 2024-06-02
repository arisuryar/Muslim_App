// ignore_for_file: must_be_immutable

part of 'surah_bloc.dart';

enum StatusSurah { initial, loading, failure, loaded }

class SurahState extends Equatable {
  StatusSurah? status;
  List<SurahEntity>? allSurah;
  SurahEntity? detailSurah;
  int? indexAyat;
  String? message;

  SurahState({
    this.status = StatusSurah.initial,
    this.allSurah,
    this.detailSurah,
    this.indexAyat,
    this.message,
  });

  SurahState copyWith({
    StatusSurah? status,
    List<SurahEntity>? allSurah,
    SurahEntity? detailSurah,
    int? indexAyat,
    String? message,
  }) {
    return SurahState(
      status: status ?? this.status,
      allSurah: allSurah ?? this.allSurah,
      detailSurah: detailSurah ?? this.detailSurah,
      indexAyat: indexAyat ?? this.indexAyat,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allSurah,
        detailSurah,
        indexAyat,
        message,
      ];
}
