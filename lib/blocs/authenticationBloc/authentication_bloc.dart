import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:WoCo/blocs/authenticationBloc/authentication_event.dart';
import 'package:WoCo/blocs/authenticationBloc/authentication_state.dart';
import 'package:WoCo/models/authentication.dart';
import 'package:WoCo/repository/authentication/authenticationRepository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(SignUpInitial());

  final AuthenticationRepository authenticationRepository =
      new AuthenticationRepository();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignUp) {
      yield* mapSignUpToEvent(event);
    }
  }

  Stream<AuthenticationState> mapSignUpToEvent(SignUp event) async* {
    try {
      yield SignUpLoading();

      Authentication auth =
          await authenticationRepository.signUp(event.email, event.password);

      yield SignUpLoaded(token: auth.token, id: auth.id);
    } catch (e) {
      yield SignUpFailure(message: e.toString());
    }
  }
}
