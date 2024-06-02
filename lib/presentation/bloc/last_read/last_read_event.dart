part of 'last_read_bloc.dart';

sealed class LastReadEvent extends Equatable {
  const LastReadEvent();

  @override
  List<Object> get props => [];
}

class OnGetLastRead extends LastReadEvent {}

class OnSaveLastRead extends LastReadEvent {
  final BookmarkEntity lastRead;

  const OnSaveLastRead(this.lastRead);
}
