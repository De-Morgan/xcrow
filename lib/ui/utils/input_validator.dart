mixin InputValidatorMixin {
  bool isEmailValid(String? email) {
    if (email == null) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isNameValid(String? name) => name?.trim()?.isNotEmpty ?? false;

  bool isPasswordValid(String? password) {
    if (password?.trim().isEmpty ?? true) return false;
    return RegExp(
            r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{10,})")
        .hasMatch('$password');
  }

  ///Not to impose password validation use in sign in page
  bool isPasswordValidRelax(String? password) =>
      password?.trim().isNotEmpty ?? false;

  bool isBvnValid(String? bvn) => bvn?.length == 11;

  bool hasOneUppercase(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'(?=.*[A-Z])').hasMatch(text);
  }

  bool hasOneLowercase(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'(?=.*[a-z])').hasMatch(text);
  }

  bool hasOneSymbol(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(
            r'^(?=.*?[)(\][)(|:};{?.="\u0027%!+<@>#\$/&*~^_-`,\u005C\u002D])')
        .hasMatch(text);
  }

  bool hasAtLeast8cha(String text) {
    if (text.trim().isEmpty) return false;
    return text.length > 7;
  }

  bool hasAtOneDigit(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'^(?=.*?[0-9])').hasMatch(text);
  }

  bool isWebSiteValid(String? website) {
    if (website == null) return false;
    const _rgx =
        r'^[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)';
    return RegExp(_rgx).hasMatch(website);
  }
}
