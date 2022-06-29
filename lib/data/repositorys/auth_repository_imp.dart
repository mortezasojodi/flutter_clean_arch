import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fluttertest/data/failure.dart';
import 'package:fluttertest/data/network/api_provider.dart';
import 'package:fluttertest/data/network/apis/auth_api.dart';
import 'package:fluttertest/domain/repositories/auth_repository.dart';

class authRepositoryImpl implements authRepository {
  // final LoginDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> signin(String email, String password) async {
    try {
      final result = await AuthAPI.signin(email, password).request();
      if (result != null)
        return Right(result["data"]["token"]);
      else
        return Left(ServerFailure("Login failed"));
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, bool>> signup(
      String name, String email, String password) async {
    try {
      final result = await AuthAPI.signup(
        name,
        email,
        password,
      ).request();
      if (result != null)
        return Right(true);
      else
        return Left(ServerFailure("Login failed"));
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, bool>> setLoginToken(String Token) async {
    try {
      final result = await AuthAPI.loginToken(Token).request();

      return Right(true);
    } on AppException catch (e) {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on Exception {
      return Left(ServerFailure(''));
    }
  }
}
