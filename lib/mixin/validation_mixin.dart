class ValidationMixin {
  String? validateEmail(String value) {
    //null if valid  else error message if
    if (!value.contains("@")) {
      return ' Please Enter a valid email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value.length < 6) {
      return "Please enter valid Password ";
    }
    return null;
  }

  String? validateUserName(value) {
    if (value.isEmpty) {
      return "Please enter UserName ";
    }
    return null;
  }
}
