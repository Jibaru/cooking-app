import 'dart:io';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/user/user_repository.dart';
import '../../data/repositories/user/user_exception.dart';
import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({@required UserRepository userRepository})
      : _userRepository = userRepository,
        super(userRepository.isUserLoaded
            ? UserLoaded(user: userRepository.loadedUser)
            : UserEmpty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print('UserBloc mapEventToState called');
    print('Event: ${event.runtimeType}');
    print('State: ${state.runtimeType}');

    if (event is UserLogIn) {
      yield _mapUserLogInToState(event);
    } else if (event is UserLogOut) {
      yield await _mapUserLogOutToState(event);
    } else if (event is UserUpdated) {
      yield* _mapUserUpdatedToState(event);
    } else if (event is UserImageProfileUpdated) {
      yield* _mapUserImageProfileUpdatedToState(event);
    }
  }

  UserState _mapUserLogInToState(UserLogIn event) {
    return UserLoaded(user: _userRepository.loadedUser);
  }

  Future<UserState> _mapUserLogOutToState(UserLogOut event) async {
    bool removed = await _userRepository.logOut();
    if (removed) {
      return UserEmpty();
    }
    return state;
  }

  Stream<UserState> _mapUserUpdatedToState(UserUpdated event) async* {
    yield UserUpdateLoading();

    try {
      await _userRepository.updateAuthenticatedUser(
        User(
          firstName: event.fields["firstName"],
          lastName: event.fields["lastName"],
          email: event.fields["email"],
          nickName: event.fields["nickName"],
        ),
      );

      yield UserUpdateSuccess(
        user: _userRepository.loadedUser,
        message: UserRepository.updateSuccessMessage,
      );
    } on UserException catch (e) {
      yield UserUpdateFailed(message: e.message);
    }
  }

  Stream<UserState> _mapUserImageProfileUpdatedToState(UserImageProfileUpdated event) async* {
    yield UserUpdateProfileImageLoading();

    try {
      await _userRepository.updateProfileImage(event.imageFile);

      yield UserUpdateSuccess(
        user: _userRepository.loadedUser,
        message: UserRepository.updateProfileImageSuccessMessage,
      );
    } on UserException catch (e) {
      yield UserUpdateFailed(message: e.message);
    }
  }
}
