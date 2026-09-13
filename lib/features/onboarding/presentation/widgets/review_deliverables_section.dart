import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Deliverable chip item in Profile Review.
class _DeliverableChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DeliverableChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: const BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: AppRadii.roundedPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Standard deliverables section in Profile Review with chips and edit button.
class ReviewDeliverablesSection extends StatelessWidget {
  final VoidCallback? onEdit;

  const ReviewDeliverablesSection({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'STANDARD DELIVERABLES',
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
        const SizedBox(height: 8),
        const Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _DeliverableChip(
              icon: Icons.movie_outlined,
              label: 'Shorts / Reels',
            ),
            _DeliverableChip(
              icon: Icons.smart_display_outlined,
              label: 'Long-Form Video',
            ),
            _DeliverableChip(
              icon: Icons.view_carousel_outlined,
              label: 'Carousel',
            ),
          ],
        ),
      ],
    );
  }
}
