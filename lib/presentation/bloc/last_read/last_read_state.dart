// ignore_for_file: must_be_immutable

part of 'last_read_bloc.dart';

enum StatusLastRead { initial, loading, failure, loaded }

class LastReadState extends Equatable {
  StatusLastRead? status;
  BookmarkEntity? lastRead;
  String? message;

  LastReadState({
    this.status = StatusLastRead.initial,
    this.lastRead,
    this.message,
  });

  LastReadState copyWith({
    StatusLastRead? status,
    BookmarkEntity? lastRead,
    String? message,
  }) {
    return LastReadState(
      status: status ?? this.status,
      lastRead: lastRead ?? this.lastRead,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, lastRead, message];
}
