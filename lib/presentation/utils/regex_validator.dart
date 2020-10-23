class RegexValidation {
  static final RegExp _validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static bool isValidEmail(String email) => _validEmail.hasMatch(email);
  static bool isInvalidEmail(String email) => !_validEmail.hasMatch(email);
}
