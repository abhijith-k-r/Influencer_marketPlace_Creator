import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../../features/role_selection/data/models/user_role.dart';

/// Application ThemeData configured for both Brand and Creator profiles.
abstract final class AppTheme {
  static ThemeData getTheme(UserRole? role) {
    if (role == UserRole.creator) {
      return creatorTheme;
    }
    return brandTheme;
  }

  /// Brand Portal Theme (Crimson Red Primary)
  static ThemeData get brandTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceContainerLowest,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceContainer,
        thickness: 1,
      ),
    );
  }

  /// Creator Hub Theme (Indigo Blue Primary)
  static ThemeData get creatorTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.secondary,
        onPrimary: AppColors.onSecondary,
        primaryContainer: AppColors.secondaryContainer,
        onPrimaryContainer: AppColors.onSecondaryContainer,
        secondary: AppColors.primary,
        onSecondary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceContainerLowest,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceContainer,
        thickness: 1,
      ),
    );
  }
}
