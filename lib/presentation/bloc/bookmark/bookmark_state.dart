// ignore_for_file: must_be_immutable

part of 'bookmark_bloc.dart';

enum StatusBookmark { initial, loading, failure, loaded }

class BookmarkState extends Equatable {
  StatusBookmark? status;
  List<BookmarkEntity>? allBookmark;
  String? message;

  BookmarkState({
    this.status = StatusBookmark.initial,
    this.allBookmark,
    this.message,
  });

  BookmarkState copyWith({
    StatusBookmark? status,
    List<BookmarkEntity>? allBookmark,
    String? message,
  }) {
    return BookmarkState(
      status: status ?? this.status,
      allBookmark: allBookmark ?? this.allBookmark,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, allBookmark, message];
}
