import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseNoParams<T> {
  Future<Either<Failure, T>> call();
}
