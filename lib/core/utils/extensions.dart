import 'package:flutter/material.dart';

/// Extension methods for String manipulation.
extension StringExtension on String {
  /// Capitalizes first letter of the string.
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// Extension methods for BuildContext helper accessors.
extension BuildContextExtension on BuildContext {
  /// Quick access to MediaQuery size.
  Size get screenSize => MediaQuery.of(this).size;

  /// Quick access to Theme.
  ThemeData get theme => Theme.of(this);
}
