import 'dart:core';

abstract class UserException implements Exception {
  final String message;

  const UserException(this.message);
}

class InvalidUserException extends UserException {
  const InvalidUserException([String message = ""]) : super(message);
}

class NotLoginException extends UserException {
  const NotLoginException([String message = ""]) : super(message);
}

class TimeoutLoginException extends UserException {
  const TimeoutLoginException([String message = ""]) : super(message);
}

class InvalidParametersException extends UserException {
  const InvalidParametersException([String message = ""]) : super(message);
}

class TimeoutUpdateUserException extends UserException {
  const TimeoutUpdateUserException([String message = ""]) : super(message);
}

class NotUpdatedUserException extends UserException {
  const NotUpdatedUserException([String message = ""]) : super(message);
}