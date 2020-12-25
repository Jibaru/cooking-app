part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationEmpty extends AuthenticationState {}

class AuthenticationLoginLoading extends AuthenticationState {}

class AuthenticationLoginFailure extends AuthenticationState {
  final String message;

  const AuthenticationLoginFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AuthenticationLoginSuccess extends AuthenticationState {}

class AuthenticationSigninLoading extends AuthenticationState {}

class AuthenticationSigninFailure extends AuthenticationState {
  final String message;

  const AuthenticationSigninFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AuthenticationSigninSuccess extends AuthenticationState {
  final String message;

  const AuthenticationSigninSuccess({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}