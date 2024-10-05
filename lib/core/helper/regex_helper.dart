class RegexHelper {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String value) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(value);
  }

  static bool hasLowerCase(String value) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(value);
  }

  static bool hasUpperCase(String value) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(value);
  }

  static bool hasNumber(String value) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(value);
  }

  static bool hasSpecialCharacter(String value) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(value);
  }

  static bool hasMinLengthPassword(String value) {
    return RegExp(r'^(?=.{6,})').hasMatch(value);
  }

  static bool hasLengthName(String value) {
    return RegExp(r'^(?=.{3,10})').hasMatch(value);
  }
}
