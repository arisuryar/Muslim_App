import 'package:equatable/equatable.dart';

class BacaanSholatEntity extends Equatable {
  final String? name;
  final String? arab;
  final String? latin;
  final String? terjemahan;

  const BacaanSholatEntity({
    this.name,
    this.arab,
    this.latin,
    this.terjemahan,
  });

  @override
  List<Object?> get props => [name, arab, latin, terjemahan];
}
