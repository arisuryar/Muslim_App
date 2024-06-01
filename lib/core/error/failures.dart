import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

  @override
  List<Object?> get props => [message];
}
