import 'package:equatable/equatable.dart';

class DoaEntity extends Equatable {
  final String? ayatArab;
  final String? ayatId;
  final String? judul;
  final String? sumber;

  const DoaEntity({
    this.ayatArab,
    this.ayatId,
    this.judul,
    this.sumber,
  });

  @override
  List<Object?> get props => [ayatArab, ayatId, judul, sumber];
}
