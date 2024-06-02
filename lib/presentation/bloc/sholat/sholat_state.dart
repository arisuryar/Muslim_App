// ignore_for_file: must_be_immutable

part of 'sholat_bloc.dart';

enum StatusSholat { initial, loading, failure, loaded }

class SholatState extends Equatable {
  StatusSholat? status;
  List<NiatSholatEntity>? allNiat;
  List<BacaanSholatEntity>? allBacaan;
  SholatEntity? sholat;
  String? message;

  SholatState({
    this.status = StatusSholat.initial,
    this.allNiat,
    this.allBacaan,
    this.sholat,
    this.message,
  });

  SholatState copyWith({
    StatusSholat? status,
    List<NiatSholatEntity>? allNiat,
    List<BacaanSholatEntity>? allBacaan,
    SholatEntity? sholat,
    String? message,
  }) {
    return SholatState(
      status: status ?? this.status,
      allNiat: allNiat ?? this.allNiat,
      allBacaan: allBacaan ?? this.allBacaan,
      sholat: sholat ?? this.sholat,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, allNiat, allBacaan, sholat, message];
}
