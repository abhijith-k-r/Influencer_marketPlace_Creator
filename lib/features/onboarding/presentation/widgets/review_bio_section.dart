import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Bio statement container with header and edit button.
class ReviewBioSection extends StatelessWidget {
  final VoidCallback? onEdit;

  const ReviewBioSection({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground.withValues(alpha: 0.6),
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BIO STATEMENT',
                style: AppTextStyles.brandPill.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.66,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: onEdit,
                child: Text(
                  'Edit',
                  style: AppTextStyles.fieldLabel.copyWith(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Passionate tech reviewer & lifestyle storyteller helping modern '
            'consumers make mindful decisions. Dedicated to cinematic gear '
            'deep-dives and design breakdown reels.',
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              color: AppColors.textPrimary,
              height: 18 / 13,
            ),
          ),
        ],
      ),
    );
  }
}
