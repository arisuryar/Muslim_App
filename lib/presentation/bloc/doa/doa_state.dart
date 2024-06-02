// ignore_for_file: must_be_immutable

part of 'doa_bloc.dart';

enum StatusDoa { initial, loading, failure, loaded }

class DoaState extends Equatable {
  StatusDoa? status;
  List<DoaEntity>? allDoa;
  String? message;

  DoaState({
    this.status = StatusDoa.initial,
    this.allDoa,
    this.message,
  });

  DoaState copyWith({
    StatusDoa? status,
    List<DoaEntity>? allDoa,
    String? message,
  }) {
    return DoaState(
      status: status ?? this.status,
      allDoa: allDoa ?? this.allDoa,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, allDoa, message];
}
