import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../../models/image.dart';
import '../../url_services.dart';
import 'user_repository.dart';
import 'user_exception.dart';

class ApiUserRepository implements UserRepository {
  static final ApiUserRepository _instance = ApiUserRepository._internal();

  final String _userIndexKey = 'userIndex';
  final Dio _client = Dio();

  User _authenticatedUser;
  AuthenticationStatus _authenticationStatus =
      AuthenticationStatus.unauthenticated;

  factory ApiUserRepository() {
    return _instance;
  }

  ApiUserRepository._internal();

  @override
  User get loadedUser => _authenticatedUser;

  @override
  bool get isUserLoaded => _authenticatedUser != null;

  @override
  AuthenticationStatus get authenticationStatus => _authenticationStatus;

  /// LogIn user set an `_authenticatedUser`
  /// Receives `email`, `password` and `keppLogged` parameters
  /// throw [UserException] if don't receives 200 status code or
  /// if any other error happens
  @override
  Future<User> logIn({
    @required String email,
    @required String password,
    bool keepLogged = false,
  }) async {
    assert(email != null);
    assert(password != null);

    try {
      final Response response = await _client.post(
        loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var responseDecoded = response.data;

        if (responseDecoded['ok']) {
          _authenticationStatus = AuthenticationStatus.authenticated;
          _authenticatedUser = User.fromMap(responseDecoded['user']);

          print(_authenticatedUser.firstName);

          if (keepLogged) {
            await _setPrefsUser(_authenticatedUser);
          } else {
            await _removePrefsUser();
          }
        } else {
          print(responseDecoded['errors']);
          _authenticationStatus = AuthenticationStatus.unauthenticated;
        }
      } else {
        throw InvalidUserException('Usuario o contraseña inválidas');
      }
    } on InvalidUserException catch (e) {
      print(e.message);
      throw e;
    } on DioError catch (e) {
      print(e.message);
      if (e.type == DioErrorType.RESPONSE) {
        throw InvalidUserException('Usuario o contraseña inválidas');
      } else if (e.type == DioErrorType.SEND_TIMEOUT ||
          e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw TimeoutLoginException('Tiempo de espera superado');
      }
    } on Exception catch (e) {
      print(e);
      throw NotLoginException('Ocurrió un problema. Intente de nuevo');
    }

    return _authenticatedUser;
  }

  /// SignIn user create one user with normal privilegies to api
  /// Receives `firstName`, `lastName`, `nickName` and `email`
  /// parameters
  /// throw [UserException] if don't receives 200 status code or
  /// if any other error happens
  @override
  Future<User> signIn({
    String firstName,
    String lastName,
    String nickName,
    String email,
    String password,
  }) async {
    assert(firstName != null);
    assert(lastName != null);
    assert(nickName != null);
    assert(email != null);
    assert(password != null);

    User user;

    try {
      final Response response = await _client.post(
        signinUrl,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'nickName': nickName,
        },
      );

      final jsonDecoded = response.data;
      user = User.fromMap(jsonDecoded['user']);
    } on InvalidUserException catch (e) {
      print(e.message);
      throw e;
    } on DioError catch (e) {
      print(e.message);
      if (e.type == DioErrorType.RESPONSE) {
        List errors = e.response.data['errors'];

        if (errors != null) {
          String message = errors
              .map((element) => element['msg'])
              .toList()
              .reduce((value, element) => value + ' \n' + element);

          throw InvalidUserException(message);
        } else {
          throw e;
        }
      } else if (e.type == DioErrorType.SEND_TIMEOUT ||
          e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw TimeoutLoginException('Tiempo de espera superado');
      }
    } on Exception catch (e) {
      print(e);
      throw NotLoginException('Ocurrió un problema. Intente de nuevo');
    }

    return user;
  }

  /// LogOut set `_authenticatedUser` to [null]
  /// returns [true] if logOut success and [false] else not
  @override
  Future<bool> logOut() async {
    bool removed = await _removePrefsUser();
    if (removed) {
      _authenticationStatus = AuthenticationStatus.unauthenticated;
      _authenticatedUser = null;
    }
    return removed;
  }

  /// Update the `_authenticatedUser` to api
  /// Recieves `user` with new fields to update
  /// throw [UserException] if don't receives 200 status code or
  /// any other error happens
  /// returns the `_authenticatedUser` with the updated fields
  @override
  Future<User> updateAuthenticatedUser(User user) async {
    assert(_authenticatedUser != null);
    assert(user != null);

    try {
      final Response response = await _client.put(
          updateOneUserUrl.replaceAll(':id', _authenticatedUser.id.toString()),
          data: {
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "nickName": user.nickName,
          }..removeWhere((key, value) => value == null));

      _authenticatedUser = _authenticatedUser.copyWith(
        firstName: response.data['user']['firstName'],
        lastName: response.data['user']['lastName'],
        email: response.data['user']['email'],
        nickName: response.data['user']['nickName'],
      );

      if ((await _getPrefsUser()) != null) {
        _setPrefsUser(_authenticatedUser);
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
      if (e.type == DioErrorType.RESPONSE) {
        List errors = e.response.data['errors'];

        if (errors != null) {
          String message = errors
              .map((element) => element['msg'])
              .toList()
              .reduce((value, element) => value + ' \n' + element);

          throw InvalidParametersException(message);
        } else {
          throw e;
        }
      } else if (e.type == DioErrorType.SEND_TIMEOUT ||
          e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw TimeoutUpdateUserException('Tiempo de espera superado');
      }
    } on Exception catch (e) {
      print(e);
      throw NotUpdatedUserException('Ocurrió un problema. Intente de nuevo');
    }

    return _authenticatedUser;
  }

  /// Update the `_authenticatedUser` Profile Image to api
  /// Recieves `file` with new image data to update
  /// throw [UserException] if don't receives 200 status code or
  /// any other error happens
  /// returns the [Image] instance updated
  Future<Image> updateProfileImage(File file) async {
    assert(_authenticatedUser != null);
    assert(file != null);

    Image image;

    try {
      final FormData formData =
          FormData.fromMap({'file': await MultipartFile.fromFile(file.path)});

      final Response response = await _client.put(
        updateProfileImageUrl.replaceAll(
            ':id', _authenticatedUser.id.toString()),
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      image = Image.fromMap(response.data['fileData']);

      _authenticatedUser = _authenticatedUser.copyWith(
        image: image,
      );

      if ((await _getPrefsUser()) != null) {
        _setPrefsUser(_authenticatedUser);
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
      if (e.type == DioErrorType.RESPONSE) {
        List errors = e.response.data['errors'];

        if (errors != null) {
          String message = errors
              .map((element) => element['msg'])
              .toList()
              .reduce((value, element) => value + ' \n' + element);

          throw InvalidParametersException(message);
        } else {
          throw e;
        }
      } else if (e.type == DioErrorType.SEND_TIMEOUT ||
          e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw TimeoutUpdateUserException('Tiempo de espera superado');
      }
    } on Exception catch (e) {
      print(e);
      throw NotUpdatedUserException('Ocurrió un problema. Intente de nuevo');
    }

    return image;
  }

  /// Load the `_authenticatedUser` from `shared_preferences`
  /// returns the `_authenticatedUser` if exists and [null] else not
  @override
  Future<User> loadPrefsUser() async {
    if (isUserLoaded) {
      return _authenticatedUser;
    }
    _authenticatedUser = await _getPrefsUser();
    return _authenticatedUser;
  }

  /// Get the `_authenticatedUser` from `shared_preferences`
  /// returns the `_authenticatedUser` if exists and [null] else not
  Future<User> _getPrefsUser() async {
    final prefs = await SharedPreferences.getInstance();

    String userSerializated = prefs.getString(_userIndexKey);

    if (userSerializated == null) {
      return null;
    }

    return User.fromJson(userSerializated);
  }

  /// Set the `_authenticatedUser` to `shared_preferences`
  /// returns the [true] if set success and [false] else not
  Future<bool> _setPrefsUser(User user) async {
    if (user == null) throw Exception('El usuario no puede ser nulo');
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userIndexKey, user.toJson());
  }

  /// Remove the `_authenticatedUser` from `shared_preferences`
  /// returns the [true] if remove success and [false] else not
  Future<bool> _removePrefsUser() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_userIndexKey);
  }
}
