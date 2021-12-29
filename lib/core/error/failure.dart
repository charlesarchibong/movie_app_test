import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  const ServerFailure({
    this.message = '',
  });

  final String message;

  @override
  List<Object> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
}
class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];
}
