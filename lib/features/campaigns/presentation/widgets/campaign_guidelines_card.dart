import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Campaign creative brief dos and donts card.
class CampaignGuidelinesCard extends StatelessWidget {
  const CampaignGuidelinesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingCard,
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Creative Guidelines & Dos/Don’ts',
            style: AppTextStyles.fieldLabel,
          ),
          AppSpacing.verticalMd,
          _buildBullet('Showcase authentic unboxing and daily tech use case.'),
          _buildBullet(
            'Mention unique noise cancellation and quick charging speed.',
          ),
          _buildBullet(
            'Include tracking affiliate link in description and bio.',
          ),
          _buildBullet(
            'Do NOT compare directly against competitor brand names.',
          ),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(top: 6, right: 8),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
