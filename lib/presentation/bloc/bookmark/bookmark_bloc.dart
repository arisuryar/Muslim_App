import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetAllBookmarkUseCase _allBookmarkUseCase;
  final SaveBookmarkUseCase _saveBookmarkUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;
  BookmarkBloc(
    this._allBookmarkUseCase,
    this._saveBookmarkUseCase,
    this._removeBookmarkUseCase,
  ) : super(BookmarkState()) {
    on<OnGetAllBookmark>(getAllBookmark);
    on<OnRemoveBookmark>(removeBookmark);
    on<OnSaveBookmark>(saveBookmark);
  }

  // Function SaveBookmark - From Usecases
  Future<void> saveBookmark(
    OnSaveBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(state.copyWith(status: StatusBookmark.loading));

    final failureOrMessage = await _saveBookmarkUseCase(
      bookmark: event.bookmark,
    );

    failureOrMessage.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusBookmark.failure,
          message: failure.message,
        ),
      ),
      (message) {
        final newBookmark = List<BookmarkEntity>.from(state.allBookmark!)
          ..add(event.bookmark);
        emit(
          state.copyWith(
            status: StatusBookmark.loaded,
            allBookmark: newBookmark,
            message: message,
          ),
        );
      },
    );
  }

  // Function RemoveBookmark - From Usecases
  Future<void> removeBookmark(
    OnRemoveBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(state.copyWith(status: StatusBookmark.loading));

    final failureOrMessage = await _removeBookmarkUseCase(
      bookmark: event.bookmark,
    );

    failureOrMessage.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusBookmark.failure,
          message: failure.message,
        ),
      ),
      (message) {
        final newBookmark = List<BookmarkEntity>.from(state.allBookmark!)
          ..removeWhere(
            (element) => element.id == event.bookmark.id,
          );

        emit(
          state.copyWith(
            status: StatusBookmark.loaded,
            allBookmark: newBookmark,
            message: message,
          ),
        );
      },
    );
  }

  // Function GetAllBookmark - From Usecases
  Future<void> getAllBookmark(
    OnGetAllBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(state.copyWith(status: StatusBookmark.loading));

    final failureOrAllBookmark = await _allBookmarkUseCase();

    failureOrAllBookmark.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusBookmark.failure,
          message: failure.message,
        ),
      ),
      (allBookmark) => emit(
        state.copyWith(
          status: StatusBookmark.loaded,
          allBookmark: allBookmark,
        ),
      ),
    );
  }
}
