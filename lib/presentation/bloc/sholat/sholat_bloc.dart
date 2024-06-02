import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../bloc.dart';

part 'sholat_event.dart';
part 'sholat_state.dart';

class SholatBloc extends Bloc<SholatEvent, SholatState> {
  final GetSholatUseCase _sholatUseCase;
  final GetAllNiatSholatUseCase _allNiatSholatUseCase;
  final GetAllBacaanSholatUseCase _allBacaanSholatUseCase;
  SholatBloc(
    this._sholatUseCase,
    this._allNiatSholatUseCase,
    this._allBacaanSholatUseCase,
  ) : super(SholatState()) {
    on<OnGetSholat>(getSholat);
    on<OnGetAllBacaanSholat>(getAllBacaanSholat);
    on<OnGetAllNiatSholat>(getAllNiatSholat);
  }

  // Function OnGetAllNiatSholat - From UseCases
  Future<void> getAllNiatSholat(
    OnGetAllNiatSholat event,
    Emitter<SholatState> emit,
  ) async {
    emit(state.copyWith(status: StatusSholat.loading));

    final failureOrAllNiat = await _allNiatSholatUseCase();

    failureOrAllNiat.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusSholat.failure,
          message: failure.message,
        ),
      ),
      (allNiat) => emit(
        state.copyWith(
          status: StatusSholat.loaded,
          allNiat: allNiat,
        ),
      ),
    );
  }

  // Function OnGetAllBacaanSholat - From UseCases
  Future<void> getAllBacaanSholat(
    OnGetAllBacaanSholat event,
    Emitter<SholatState> emit,
  ) async {
    emit(state.copyWith(status: StatusSholat.loading));

    final failureOrAllBacaan = await _allBacaanSholatUseCase();

    failureOrAllBacaan.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusSholat.failure,
          message: failure.message,
        ),
      ),
      (allBacaan) => emit(
        state.copyWith(
          status: StatusSholat.loaded,
          allBacaan: allBacaan,
        ),
      ),
    );
  }

  // Function OnGetSholat - From UseCases
  Future<void> getSholat(
    OnGetSholat event,
    Emitter<SholatState> emit,
  ) async {
    emit(state.copyWith(status: StatusSholat.loading));

    final failureOrSholat = await _sholatUseCase(
      location: event.locationEntity,
    );

    failureOrSholat.fold(
      (failure) => emit(
        state.copyWith(
          status: StatusSholat.failure,
          message: failure.message,
        ),
      ),
      (sholat) => emit(
        state.copyWith(
          status: StatusSholat.loaded,
          sholat: sholat,
        ),
      ),
    );
  }
}
