import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'hadits_event.dart';
part 'hadits_state.dart';

class HaditsBloc extends Bloc<HaditsEvent, HaditsState> {
  final GetAllHaditsUseCase _useCase;
  HaditsBloc(
    this._useCase,
  ) : super(HaditsState()) {
    on<OnGetAllHadits>(getAllHadits);
  }

  // Function GetAllHadits - From UseCases
  Future<void> getAllHadits(
    OnGetAllHadits event,
    Emitter<HaditsState> emit,
  ) async {
    emit(state.copyWith(status: StatusHadits.loading));

    final failureOrAllHadits = await _useCase();

    failureOrAllHadits.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusHadits.failure,
          message: failure.message,
        ),
      ),
      (allHadits) => emit(
        state.copyWith(
          status: StatusHadits.loaded,
          allHadits: allHadits,
        ),
      ),
    );
  }
}
