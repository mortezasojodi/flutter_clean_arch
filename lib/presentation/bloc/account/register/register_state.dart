import 'package:equatable/equatable.dart';

abstract class registerState extends Equatable {
  const registerState();

  @override
  List<Object?> get props => [];
}

class registerEmpty extends registerState {}

class registerLoading extends registerState {}

class registerError extends registerState {
  final String message;

  registerError(this.message);

  @override
  List<Object?> get props => [message];
}

class registerSuccess extends registerState {}
