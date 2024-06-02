part of 'hadits_bloc.dart';

sealed class HaditsEvent extends Equatable {
  const HaditsEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllHadits extends HaditsEvent {}
