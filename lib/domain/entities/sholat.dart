import 'package:equatable/equatable.dart';

class SholatEntity extends Equatable {
  final List<String>? timings;
  final String? date;
  final String? hijriah;

  const SholatEntity({
    this.timings,
    this.date,
    this.hijriah,
  });

  @override
  List<Object?> get props => [
        timings,
        date,
        hijriah,
      ];
}
