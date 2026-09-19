import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Semantic alert types for global AppSnackBar.
enum AppSnackBarType { info, success, error, warning }

/// Single-source-of-truth snackbar utility for consistent in-app notifications (<95 LOC).
class AppSnackBar {
  AppSnackBar._();

  static void showSuccess(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: AppSnackBarType.success, duration: duration);
  }

  static void showError(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: AppSnackBarType.error, duration: duration);
  }

  static void showInfo(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: AppSnackBarType.info, duration: duration);
  }

  static void showWarning(BuildContext context, String message, {Duration? duration}) {
    show(context, message: message, type: AppSnackBarType.warning, duration: duration);
  }

  static void show(
    BuildContext context, {
    required String message,
    AppSnackBarType type = AppSnackBarType.info,
    Duration? duration,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    final (Color accentColor, IconData icon) = switch (type) {
      AppSnackBarType.success => (AppColors.emerald, Icons.check_circle_rounded),
      AppSnackBarType.error => (AppColors.rose, Icons.error_outline_rounded),
      AppSnackBarType.warning => (AppColors.amber, Icons.warning_amber_rounded),
      AppSnackBarType.info => (AppColors.primary, Icons.info_outline_rounded),
    };

    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: const Color(0xFF1E2230),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: accentColor.withValues(alpha: 0.35), width: 1),
        ),
        duration: duration ?? const Duration(seconds: 3),
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: accentColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.labelMd(color: Colors.white).copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
