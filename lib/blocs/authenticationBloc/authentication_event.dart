import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationEvent extends Equatable {}

class SignUp extends AuthenticationEvent {
  final String email;
  final String password;

  SignUp({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LogIn extends AuthenticationEvent {
  final String email;
  final String password;

  LogIn({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
