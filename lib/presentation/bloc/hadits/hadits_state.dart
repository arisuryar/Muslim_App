// ignore_for_file: must_be_immutable

part of 'hadits_bloc.dart';

enum StatusHadits { initial, loading, failure, loaded }

class HaditsState extends Equatable {
  StatusHadits? status;
  List<HaditsEntity>? allHadits;
  String? message;

  HaditsState({
    this.status = StatusHadits.initial,
    this.allHadits,
    this.message,
  });

  HaditsState copyWith({
    StatusHadits? status,
    List<HaditsEntity>? allHadits,
    String? message,
  }) {
    return HaditsState(
      status: status ?? this.status,
      allHadits: allHadits ?? this.allHadits,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, allHadits, message];
}
