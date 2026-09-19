import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorPaymentDetailsHeader extends StatelessWidget {
  final VoidCallback onBack;

  const CreatorPaymentDetailsHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: CreatorColors.surfaceContainerLowest,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              color: CreatorColors.onSurface,
              onPressed: onBack,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Payment Details',
                style: AppTextStyles.headlineSm(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Campaign Escrow & Milestones',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
