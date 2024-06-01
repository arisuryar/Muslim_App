import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class BacaanSholatModel extends Equatable {
  final String? name;
  final String? arab;
  final String? latin;
  final String? terjemahan;

  const BacaanSholatModel({
    this.name,
    this.arab,
    this.latin,
    this.terjemahan,
  });

  factory BacaanSholatModel.fromJson(Map<String, dynamic> json) {
    return BacaanSholatModel(
      name: json['name'],
      arab: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
    );
  }

  BacaanSholatEntity toEntity() {
    return BacaanSholatEntity(
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
