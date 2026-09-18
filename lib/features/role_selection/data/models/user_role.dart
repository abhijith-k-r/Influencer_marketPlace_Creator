import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Represents the active user persona/side: Brand or Creator.
enum UserRole {
  brand,
  creator;

  bool get isBrand => this == UserRole.brand;
  bool get isCreator => this == UserRole.creator;

  String get displayName => isBrand ? 'Brand' : 'Creator';
  String get portalTitle => isBrand ? 'Brand Portal' : 'Creator Hub';

  Color get primaryColor => isBrand ? AppColors.primary : AppColors.secondary;
  Color get primaryContainerColor =>
      isBrand ? AppColors.primaryContainer : AppColors.secondaryContainer;
  Color get fixedColor =>
      isBrand ? AppColors.primaryFixed : AppColors.secondaryFixed;
  Color get onFixedColor =>
      isBrand ? AppColors.onPrimaryFixed : AppColors.onSecondaryFixed;
}
