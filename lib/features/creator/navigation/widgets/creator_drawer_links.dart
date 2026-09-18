import 'package:flutter/material.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorDrawerLinks extends StatelessWidget {
  const CreatorDrawerLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RESOURCES & SAFETY',
          style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        _buildItem(icon: Icons.rule_rounded, title: 'Creator Guidelines', onTap: () {}),
        _buildItem(icon: Icons.support_agent_rounded, title: 'Community Support', badge: '24/7', onTap: () {}),
        _buildItem(icon: Icons.storefront_rounded, title: 'Brand Opportunities', onTap: () {}),
        const SizedBox(height: 16),
        const Divider(color: CreatorColors.surfaceContainerHigh),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.verified_rounded, size: 18, color: CreatorColors.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Official Apple & Stripe Verified Escrow',
                style: AppTextStyles.labelSm(color: CreatorColors.outline),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CollabConnect v2.4', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
            Text(
              'Privacy & Terms',
              style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItem({required IconData icon, required String title, String? badge, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(color: CreatorColors.surfaceContainer, borderRadius: BorderRadius.circular(8)),
                  child: Icon(icon, size: 18, color: CreatorColors.outline),
                ),
                const SizedBox(width: 12),
                Text(title, style: AppTextStyles.bodyLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                if (badge != null)
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: CreatorColors.primaryFixed, borderRadius: AppRadii.roundedPill),
                    child: Text(
                      badge,
                      style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                const Icon(Icons.chevron_right_rounded, size: 18, color: CreatorColors.outline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
