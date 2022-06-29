import 'package:dartz/dartz.dart';
import 'package:fluttertest/data/failure.dart';

abstract class authRepository {
  Future<Either<Failure, String>> signin(String email, String password);
  Future<Either<Failure, bool>> signup(
      String name, String email, String password);
  Future<Either<Failure, bool>> setLoginToken(String token);
}
