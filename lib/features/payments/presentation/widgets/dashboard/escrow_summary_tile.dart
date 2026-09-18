import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/theme/app_text_styles.dart';

class EscrowSummaryTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String badgeText;
  final Color badgeBg;
  final Color badgeColor;
  final String title;
  final String amount;
  final String subtitle;

  const EscrowSummaryTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.badgeText,
    required this.badgeBg,
    required this.badgeColor,
    required this.title,
    required this.amount,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(AppRadii.full),
                ),
                child: Text(badgeText, style: AppTextStyles.labelSm(color: badgeColor)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
          const SizedBox(height: 2),
          Text(amount, style: AppTextStyles.headlineSm()),
          const SizedBox(height: 2),
          Text(subtitle, style: AppTextStyles.bodySm(color: AppColors.tertiary)),
        ],
      ),
    );
  }
}
