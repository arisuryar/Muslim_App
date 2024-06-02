import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'last_read_event.dart';
part 'last_read_state.dart';

class LastReadBloc extends Bloc<LastReadEvent, LastReadState> {
  final GetLastReadUseCase _getLastReadUseCase;
  final SaveLastReadUseCase _saveLastReadUseCase;
  LastReadBloc(
    this._getLastReadUseCase,
    this._saveLastReadUseCase,
  ) : super(LastReadState()) {
    on<OnGetLastRead>(getLastRead);
    on<OnSaveLastRead>(saveLastRead);
  }

  // Function SaveLastRead - From Usecases
  Future<void> saveLastRead(
    OnSaveLastRead event,
    Emitter<LastReadState> emit,
  ) async {
    emit(state.copyWith(status: StatusLastRead.loading));

    final failureOrMessage = await _saveLastReadUseCase(
      lastRead: event.lastRead,
    );

    failureOrMessage.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusLastRead.failure,
          message: failure.message,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: StatusLastRead.loaded,
          lastRead: event.lastRead,
          message: message,
        ),
      ),
    );
  }

  // Function GetLastRead - From Usecases
  Future<void> getLastRead(
    OnGetLastRead event,
    Emitter<LastReadState> emit,
  ) async {
    emit(state.copyWith(status: StatusLastRead.loading));

    final failureOrLastRead = await _getLastReadUseCase();

    failureOrLastRead.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusLastRead.failure,
          message: failure.message,
        ),
      ),
      (lastRead) => emit(
        state.copyWith(
          status: StatusLastRead.loaded,
          lastRead: lastRead,
        ),
      ),
    );
  }
}
