import 'dart:async';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetAllSurahUseCase _allSurahUseCase;
  final GetDetailSurahUseCase _detailSurahUseCase;

  SurahBloc(
    this._allSurahUseCase,
    this._detailSurahUseCase,
  ) : super(SurahState()) {
    on<OnGetAllSurah>(getAllSurah);
    on<OnGetDetailSurah>(getDetailSurah);
  }

  // Function GetDetailSurahUseCase - From Usecases
  Future<void> getDetailSurah(
    OnGetDetailSurah event,
    Emitter<SurahState> emit,
  ) async {
    emit(state.copyWith(status: StatusSurah.loading));

    final failureOrDetailSurah = await _detailSurahUseCase(
      id: event.idSurah,
    );

    failureOrDetailSurah.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusSurah.failure,
          message: failure.message,
        ),
      ),
      (detailSurah) => emit(
        state.copyWith(
          status: StatusSurah.loaded,
          detailSurah: detailSurah,
        ),
      ),
    );
  }

  // Function GetAllSurahUseCase - From Usecases
  Future<void> getAllSurah(
    OnGetAllSurah event,
    Emitter<SurahState> emit,
  ) async {
    emit(state.copyWith(status: StatusSurah.loading));

    final failureOrAllSurah = await _allSurahUseCase();

    failureOrAllSurah.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusSurah.failure,
          message: failure.message,
        ),
      ),
      (allSurah) => emit(
        state.copyWith(
          status: StatusSurah.loaded,
          allSurah: allSurah,
        ),
      ),
    );
  }
}
