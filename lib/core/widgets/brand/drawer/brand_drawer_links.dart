import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_radii.dart';
import '../../../theme/app_text_styles.dart';

/// Navigation and resource links inside BrandSideDrawer.
class BrandDrawerLinks extends StatelessWidget {
  const BrandDrawerLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RESOURCES & SAFETY',
          style: AppTextStyles.labelSm(color: AppColors.tertiary).copyWith(
            letterSpacing: 0.8,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        _buildLink(icon: Icons.rule_rounded, title: 'Creator Guidelines', onTap: () {}),
        _buildLink(icon: Icons.support_agent_rounded, title: 'Community Support', badgeText: '24/7', onTap: () {}),
        _buildLink(icon: Icons.storefront_rounded, title: 'For Brands & Agencies', onTap: () {}),
      ],
    );
  }

  Widget _buildLink({
    required IconData icon,
    required String title,
    String? badgeText,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 20, color: AppColors.tertiary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.labelMd(color: AppColors.onSurface).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (badgeText != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer.withValues(alpha: 0.15),
                    borderRadius: AppRadii.roundedPill,
                  ),
                  child: Text(
                    badgeText,
                    style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
