import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorPulseToastRow extends StatelessWidget {
  const CreatorPulseToastRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: CreatorColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: CreatorColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'LIVE MARKETPLACE',
                  style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixedVariant).copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.bolt_rounded, size: 16, color: CreatorColors.primary),
              const SizedBox(width: 4),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.bodySm(color: CreatorColors.outline),
                  children: [
                    TextSpan(
                      text: '14 New Drops ',
                      style: AppTextStyles.bodySm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(text: 'Today'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
