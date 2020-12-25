part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState {}

class UserLoaded extends UserState {
  final User user;

  const UserLoaded({@required this.user});

  @override
  List<Object> get props => [user];
}

class UserUpdateLoading extends UserState {}

class UserUpdateSuccess extends UserState {
  final User user;
  final String message;

  const UserUpdateSuccess({@required this.user, this.message = ''});

  @override
  List<Object> get props => [user, message];
}

class UserUpdateFailed extends UserState {
  final String message;

  const UserUpdateFailed({@required this.message});

  @override
  List<Object> get props => [message];
}
