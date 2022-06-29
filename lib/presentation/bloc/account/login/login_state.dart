import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginEmpty extends LoginState {}

class loginLoading extends LoginState {}

class loginError extends LoginState {
  final String message;

  loginError(this.message);

  @override
  List<Object?> get props => [message];
}

class loginSuccess extends LoginState {}
// class WeatherError extends WeatherState {
//   final String message;

//   WeatherError(this.message);

//   @override
//   List<Object?> get props => [message];
// }

// class WeatherHasData extends WeatherState {
//   final Weather result;

//   WeatherHasData(this.result);

//   @override
//   List<Object?> get props => [result];
// }
