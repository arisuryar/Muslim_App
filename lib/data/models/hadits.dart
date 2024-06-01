import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class HaditsModel extends Equatable {
  final String? ayatArab;
  final String? ayatId;
  final String? judul;

  const HaditsModel({
    this.ayatArab,
    this.ayatId,
    this.judul,
  });

  factory HaditsModel.fromJson(Map<String, dynamic> json) {
    return HaditsModel(
      ayatArab: json['arab'],
      ayatId: json['indo'],
      judul: json['judul'],
    );
  }

  HaditsEntity toEntity() {
    return HaditsEntity(
      ayatArab: ayatArab,
      ayatId: ayatId,
      judul: judul,
    );
  }

  @override
  List<Object?> get props => [
        ayatArab,
        ayatId,
        judul,
      ];
}
