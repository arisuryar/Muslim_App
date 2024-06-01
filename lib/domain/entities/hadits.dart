import 'package:equatable/equatable.dart';

class HaditsEntity extends Equatable {
  final String? ayatArab;
  final String? ayatId;
  final String? judul;

  const HaditsEntity({
    this.ayatArab,
    this.ayatId,
    this.judul,
  });

  @override
  List<Object?> get props => [
        ayatArab,
        ayatId,
        judul,
      ];
}
