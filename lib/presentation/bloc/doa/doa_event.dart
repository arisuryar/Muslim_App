part of 'doa_bloc.dart';

sealed class DoaEvent extends Equatable {
  const DoaEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllDoa extends DoaEvent {}
