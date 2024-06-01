import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class SholatModel extends Equatable {
  final List<String>? timings;
  final String? date;
  final String? hijriah;

  const SholatModel({
    this.timings,
    this.date,
    this.hijriah,
  });

  factory SholatModel.fromJson(Map<String, dynamic> json) {
    return SholatModel(
      timings: List.from({
        json['timings']['Fajr'],
        json['timings']['Dhuhr'],
        json['timings']['Asr'],
        json['timings']['Maghrib'],
        json['timings']['Isha'],
      }),
      date: json['date']['readable'],
      hijriah: json['date']['hijri']['date'],
    );
  }

  SholatEntity toEntity() {
    return SholatEntity(
      timings: timings,
      date: date,
      hijriah: hijriah,
    );
  }

  @override
  List<Object?> get props => [
        timings,
        date,
        hijriah,
      ];
}
