import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class DoaModel extends Equatable {
  final String? ayatArab;
  final String? ayatId;
  final String? judul;
  final String? sumber;

  const DoaModel({
    this.ayatArab,
    this.ayatId,
    this.judul,
    this.sumber,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) {
    return DoaModel(
      ayatArab: json['arab'],
      ayatId: json['indo'],
      judul: json['judul'],
      sumber: json['source'],
    );
  }

  DoaEntity toEntity() {
    return DoaEntity(
      ayatArab: ayatArab,
      ayatId: ayatId,
      judul: judul,
      sumber: sumber,
    );
  }

  @override
  List<Object?> get props => [
        ayatArab,
        ayatId,
        judul,
        sumber,
      ];
}
