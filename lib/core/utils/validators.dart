/// Common string and form validation utility functions.
class Validators {
  Validators._();

  /// Validates if an email address is valid.
  static bool isValidEmail(String? email) {
    if (email == null || email.trim().isEmpty) return false;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email.trim());
  }

  /// Validates if a phone number is valid (minimum 10 digits).
  static bool isValidPhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) return false;
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 10;
  }

  /// Validates non-empty required string.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
