import 'package:dartz/dartz.dart';
import 'package:fluttertest/data/failure.dart';
import 'package:fluttertest/domain/repositories/auth_repository.dart';

class setLoginuc {
  final authRepository repository;

  setLoginuc(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) {
    return repository.signin(email, password);
  }
}

class setLoginToken {
  final authRepository repository;

  setLoginToken(this.repository);

  Future<Either<Failure, bool>> execute(
    String Token,
  ) {
    return repository.setLoginToken(Token);
  }
}
