part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserLogIn extends UserEvent {}

class UserLogOut extends UserEvent {}

class UserUpdated extends UserEvent {
  final Map<String, String> fields;

  const UserUpdated({@required this.fields,});

  @override
  List<Object> get props => [fields];
}

class UserImageChanged extends UserEvent {
  final File imageFile;

  const UserImageChanged({@required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}
