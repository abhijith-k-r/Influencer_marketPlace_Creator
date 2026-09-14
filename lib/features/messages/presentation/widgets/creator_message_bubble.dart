import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Right-aligned outgoing creator message bubble with double check status.
class CreatorMessageBubble extends StatelessWidget {
  final String text;
  final String time;

  const CreatorMessageBubble({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: const BoxDecoration(
            gradient: AppColors.chatBubbleOutgoingGradient,
            borderRadius: AppRadii.bubbleOutgoing,
            boxShadow: AppShadows.subtle,
          ),
          child: Text(
            text,
            style: AppTextStyles.chatBubble,
          ),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: AppTextStyles.chatTimestamp,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.done_all, size: 14, color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}
