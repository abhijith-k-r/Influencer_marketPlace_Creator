import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/my_works/data/models/creator_work_item.dart';

/// Action bottom bar of a work card showing next milestone step and CTA button.
class MyWorksCardFooter extends StatelessWidget {
  final CreatorWorkItem item;
  final VoidCallback onTap;

  const MyWorksCardFooter({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPaid = item.status == 'Paid';
    final isApplied = item.status == 'Applied';
    final buttonBg = (isPaid || isApplied)
        ? CreatorColors.surfaceContainer
        : CreatorColors.primaryFixed;
    final buttonTextColor = (isPaid || isApplied)
        ? CreatorColors.onSurface
        : CreatorColors.onPrimaryFixedVariant;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                item.nextStepIcon,
                size: 16,
                color: isApplied ? CreatorColors.tertiary : CreatorColors.primary,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  item.nextStep,
                  style: AppTextStyles.labelMd(
                    color: CreatorColors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: onTap,
          borderRadius: AppRadii.roundedMd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: buttonBg,
              borderRadius: AppRadii.roundedMd,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.actionButtonText,
                  style: AppTextStyles.labelMd(
                    color: buttonTextColor,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: buttonTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
