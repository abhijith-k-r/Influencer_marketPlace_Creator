import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorBalanceMetricCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback? onAction;
  final String? actionLabel;

  const CreatorBalanceMetricCard({
    super.key,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.icon,
    this.isPrimary = false,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    final bgGradient = isPrimary
        ? const LinearGradient(
            colors: [CreatorColors.primary, CreatorColors.primaryContainer],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary ? null : CreatorColors.surfaceContainerLowest,
        gradient: bgGradient,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: AppTextStyles.labelSm(
                    color: isPrimary ? Colors.white.withValues(alpha: 0.8) : CreatorColors.outline,
                  ).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isPrimary ? Colors.white.withValues(alpha: 0.15) : CreatorColors.surfaceContainerLow,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: isPrimary ? Colors.white : CreatorColors.primary,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: AppTextStyles.headlineLg(
                  color: isPrimary ? Colors.white : CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w800, fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.labelSm(
                  color: isPrimary ? Colors.white.withValues(alpha: 0.8) : CreatorColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          if (actionLabel != null && onAction != null)
            SizedBox(
              width: double.infinity,
              height: 36,
              child: ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPrimary ? Colors.white : CreatorColors.primaryFixed,
                  foregroundColor: isPrimary ? CreatorColors.primary : CreatorColors.onPrimaryFixedVariant,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: Text(
                  actionLabel!,
                  style: AppTextStyles.labelSm(
                    color: isPrimary ? CreatorColors.primary : CreatorColors.onPrimaryFixedVariant,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
