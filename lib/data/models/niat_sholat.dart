import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class NiatSholatModel extends Equatable {
  final String? name;
  final String? arab;
  final String? latin;
  final String? terjemahan;

  const NiatSholatModel({
    this.name,
    this.arab,
    this.latin,
    this.terjemahan,
  });

  factory NiatSholatModel.fromJson(Map<String, dynamic> json) {
    return NiatSholatModel(
      name: json['name'],
      arab: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
    );
  }

  NiatSholatEntity toEntity() {
    return NiatSholatEntity(
      arab: arab,
      latin: latin,
      name: name,
      terjemahan: terjemahan,
    );
  }

  @override
  List<Object?> get props => [
        name,
        arab,
        latin,
        terjemahan,
      ];
}
