import 'package:flutter/material.dart';

/// Data model for brand home category filter chip (<25 LOC).
class FilterChipItem {
  final String label;
  final IconData? icon;
  final Color? iconColor;

  const FilterChipItem({
    required this.label,
    this.icon,
    this.iconColor,
  });
}
