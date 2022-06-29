import 'package:equatable/equatable.dart';

abstract class loginEvent extends Equatable {
  const loginEvent();

  @override
  List<Object?> get props => [];
}

class setLoginEvent extends loginEvent {
  final String email;
  final String password;

  setLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
