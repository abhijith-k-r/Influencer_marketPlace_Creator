import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Left-aligned incoming brand message bubble with headphones avatar.
class BrandMessageBubble extends StatelessWidget {
  final String text;
  final String time;

  const BrandMessageBubble({super.key, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 28,
          height: 28,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: const BoxDecoration(
            color: AppColors.strengthInactive,
            borderRadius: AppRadii.roundedSm,
          ),
          child: const Icon(
            Icons.headphones_rounded,
            size: 16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceWhite,
                  borderRadius: AppRadii.bubbleIncoming,
                  boxShadow: AppShadows.subtle,
                ),
                child: Text(
                  text,
                  style: AppTextStyles.chatBubble,
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  time,
                  style: AppTextStyles.chatTimestamp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
