import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Header row for aggregated reach card with query_stats icon and edit button.
class ReviewReachCardHeader extends StatelessWidget {
  final VoidCallback? onEdit;

  const ReviewReachCardHeader({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.buttonPrimary,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.query_stats,
                  size: 14,
                  color: AppColors.surfaceWhite,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'TOTAL AGGREGATED REACH',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.brandPill.copyWith(
                    fontSize: 11,
                    letterSpacing: 0.66,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
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
    );
  }
}
