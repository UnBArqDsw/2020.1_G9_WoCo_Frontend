import 'package:WoCo/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

// Sign Up
class SignUpInitial extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class SignUpLoading extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class SignUpLoaded extends AuthenticationState {
  final int id;
  final String token;

  SignUpLoaded({this.id, this.token});

  @override
  List<Object> get props => null;
}

class SignUpFailure extends AuthenticationState {
  final String message;

  SignUpFailure({this.message});

  @override
  List<Object> get props => null;
}

// Log In
class LogInInitial extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class LogInLoading extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class LogInLoaded extends AuthenticationState {
  final int id;
  final String token;

  LogInLoaded({this.id, this.token});

  @override
  List<Object> get props => null;
}

class LogInFailure extends AuthenticationState {
  final String message;

  LogInFailure({this.message});

  @override
  List<Object> get props => null;
}
