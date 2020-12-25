import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/user/user_repository.dart';
import '../../data/repositories/user/user_exception.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required userRepository})
      : _userRepository = userRepository,
        super(AuthenticationEmpty());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    print('AuthenticationBloc mapEventToState called');
    print('Event: ${event.runtimeType}');
    print('State: ${state.runtimeType}');

    if (event is AuthenticationLoginSubmitted) {
      yield* _mapAuthenticationLoginSubmittedToState(event);
    } else if (event is AuthenticationSigninSubmitted) {
      yield* _mapAuthenticationSigninSubmittedToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoginSubmittedToState(
    AuthenticationLoginSubmitted event,
  ) async* {
    yield AuthenticationLoginLoading();

    try {
      await _userRepository.logIn(
        email: event.email,
        password: event.password,
        keepLogged: event.keepLogged,
      );

      if (_userRepository.authenticationStatus ==
          AuthenticationStatus.authenticated) {
        yield AuthenticationLoginSuccess();
      }
    } on UserException catch (e) {
      yield AuthenticationLoginFailure(message: e.message);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationSigninSubmittedToState(
    AuthenticationSigninSubmitted event,
  ) async* {
    yield AuthenticationSigninLoading();

    try {
      final userSigned = await _userRepository.signIn(
        firstName: event.firstName,
        lastName: event.lastName,
        nickName: event.nickName,
        email: event.email,
        password: event.password,
      );

      if (userSigned != null) {
        yield AuthenticationSigninSuccess(
            message: UserRepository.signinSuccessMessage);
      }
    } on UserException catch (e) {
      yield AuthenticationSigninFailure(message: e.message);
    }
  }
}
