// ignore_for_file: must_be_immutable

part of 'surah_bloc.dart';

sealed class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllSurah extends SurahEvent {}

class OnGetDetailSurah extends SurahEvent {
  final int idSurah;
  int? indexAyat;

  OnGetDetailSurah(this.idSurah, this.indexAyat);
}
