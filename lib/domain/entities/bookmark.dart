import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable {
  final String? id;
  final String? nameArab;
  final String? nameId;
  final int? numberSurah;
  final int? numberAyat;
  final int? indexAyat;
  final DateTime? date;

  const BookmarkEntity({
    this.id,
    this.nameArab,
    this.nameId,
    this.numberSurah,
    this.numberAyat,
    this.indexAyat,
    this.date,
  });

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
