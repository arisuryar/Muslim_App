import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final GetAllDoaUseCase _useCase;
  DoaBloc(
    this._useCase,
  ) : super(DoaState()) {
    on<OnGetAllDoa>(getAllDoa);
  }

  // Function GetAllDoa - From UseCases
  Future<void> getAllDoa(
    OnGetAllDoa event,
    Emitter<DoaState> emit,
  ) async {
    emit(state.copyWith(status: StatusDoa.loading));

    final failureOrAllDoa = await _useCase();

    failureOrAllDoa.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusDoa.failure,
          message: failure.message,
        ),
      ),
      (allDoa) => emit(
        state.copyWith(
          status: StatusDoa.loaded,
          allDoa: allDoa,
        ),
      ),
    );
  }
}
