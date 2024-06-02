part of 'sholat_bloc.dart';

sealed class SholatEvent extends Equatable {
  const SholatEvent();

  @override
  List<Object> get props => [];
}

class OnGetSholat extends SholatEvent {
  final LocationEntity locationEntity;

  const OnGetSholat(this.locationEntity);
}

class OnGetAllNiatSholat extends SholatEvent {}

class OnGetAllBacaanSholat extends SholatEvent {}
