import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

enum AppPillVariant { inProgress, pendingEscrow, settled, actionRequired, draft, review, neutral }

/// Global status pill component used uniformly across Brand and Creator features (<95 LOC).
class AppStatusPill extends StatelessWidget {
  final String label;
  final AppPillVariant? variant;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final IconData? icon;

  const AppStatusPill({
    super.key,
    required this.label,
    this.variant,
    this.customBackgroundColor,
    this.customTextColor,
    this.icon,
  });

  AppPillVariant _resolveVariant() {
    if (variant != null) return variant!;
    final lower = label.toLowerCase();
    if (lower.contains('settled') || lower.contains('paid') || lower.contains('completed')) return AppPillVariant.settled;
    if (lower.contains('action') || lower.contains('rejected') || lower.contains('urgent')) return AppPillVariant.actionRequired;
    if (lower.contains('pending') || lower.contains('escrow') || lower.contains('review')) return AppPillVariant.pendingEscrow;
    if (lower.contains('draft')) return AppPillVariant.draft;
    if (lower.contains('progress') || lower.contains('active') || lower.contains('ongoing')) return AppPillVariant.inProgress;
    return AppPillVariant.neutral;
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (_resolveVariant()) {
      case AppPillVariant.settled:
        bgColor = const Color(0x1F00A86B);
        textColor = const Color(0xFF00A86B);
        break;
      case AppPillVariant.actionRequired:
        bgColor = const Color(0x2EBA1A1A);
        textColor = CreatorColors.error;
        break;
      case AppPillVariant.pendingEscrow:
      case AppPillVariant.review:
        bgColor = const Color(0x2E7C5800);
        textColor = const Color(0xFFD49700);
        break;
      case AppPillVariant.draft:
      case AppPillVariant.neutral:
        bgColor = CreatorColors.surfaceContainerHigh;
        textColor = CreatorColors.onSurfaceVariant;
        break;
      case AppPillVariant.inProgress:
        bgColor = CreatorColors.primaryFixed;
        textColor = CreatorColors.onPrimaryFixedVariant;
        break;
    }

    if (customBackgroundColor != null) bgColor = customBackgroundColor!;
    if (customTextColor != null) textColor = customTextColor!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: AppRadii.roundedFull),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(),
            style: AppTextStyles.labelSm(color: textColor).copyWith(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }
}
