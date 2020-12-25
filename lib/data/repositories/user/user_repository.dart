import 'package:meta/meta.dart';

import '../../../models/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class UserRepository {
  static final String signinSuccessMessage =
      'Registro correcto, inicie sesión para empezar a crear recetas';
  static final String updateSuccessMessage =
      'Usuario actualizado correctamente';

  User get loadedUser;
  bool get isUserLoaded;
  AuthenticationStatus get authenticationStatus;
  Future<User> logIn({
    @required String email,
    @required String password,
    bool keepLogged = false,
  });
  Future<User> signIn({
    String firstName,
    String lastName,
    String nickName,
    String email,
    String password,
  });
  Future<bool> logOut();
  Future<User> updateAuthenticatedUser(User user);
  Future<User> loadPrefsUser();
}
