import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {}

class SplashSuccessAutorized extends SplashState {}

class SplashSuccessNotAutorized extends SplashState {}

class SplashError extends SplashState {}

class WeatherHasData extends SplashState {
  final int result;

  WeatherHasData(this.result);

  @override
  List<Object?> get props => [result];
}
