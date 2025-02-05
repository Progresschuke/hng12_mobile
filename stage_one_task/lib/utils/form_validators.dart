class FormValidator {
  // Validate secretKey strength (example)
  static String? validateKey(String? text) {
    if (text == null || text.isEmpty) return "Field cannot be left empty";
    if (text.length < 10) {
      return "Secret key must be at least 10 characters long";
    }
    return null;
  }

  // Check if a field is not empty
  static String? notEmpty(String? text, {String? message}) {
    if (text == null || text.isEmpty) {
      return message ?? "Field cannot be left empty";
    }
    return null;
  }
  // Validate encrypted text

  static String? decryptValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter text to decrypt';
    }

    // Check if the input is a valid Base64 string
    if (!_isBase64(value)) {
      return 'Invalid encrypted text format';
    }

    return null;
  }

  static bool _isBase64(String text) {
    final base64RegExp = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64RegExp.hasMatch(text) && text.length % 4 == 0;
  }
}
