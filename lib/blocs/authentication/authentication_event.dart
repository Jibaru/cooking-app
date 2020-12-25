part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginSubmitted extends AuthenticationEvent {
  final String email;
  final String password;
  final bool keepLogged;

  const AuthenticationLoginSubmitted({
    @required this.email,
    @required this.password,
    @required this.keepLogged,
  });

  @override
  List<Object> get props => [email, password, keepLogged];
}

class AuthenticationSigninSubmitted extends AuthenticationEvent {
  final String firstName;
  final String lastName;
  final String nickName;
  final String email;
  final String password;

  const AuthenticationSigninSubmitted({
    @required this.firstName,
    @required this.lastName,
    @required this.nickName,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [firstName, lastName, nickName, email, password];
}
