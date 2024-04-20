import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';

abstract class UseCase<R, P> {
  /// Default usecase
  /// R is the return of function call
  /// P is the parameter of function call
  Future<Either<Failure, R>> call(P parameter);
}

class NoParameter {}
