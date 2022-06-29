import 'package:dartz/dartz.dart';
import 'package:fluttertest/data/failure.dart';
import 'package:fluttertest/domain/repositories/auth_repository.dart';

class setRegisteruc {
  final authRepository repository;

  setRegisteruc(this.repository);

  Future<Either<Failure, bool>> execute(
      String email, String password, String name) {
    return repository.signup(name, email, password);
  }
}
