part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllBookmark extends BookmarkEvent {}

class OnSaveBookmark extends BookmarkEvent {
  final BookmarkEntity bookmark;

  const OnSaveBookmark(this.bookmark);
}

class OnRemoveBookmark extends BookmarkEvent {
  final BookmarkEntity bookmark;

  const OnRemoveBookmark(this.bookmark);
}
