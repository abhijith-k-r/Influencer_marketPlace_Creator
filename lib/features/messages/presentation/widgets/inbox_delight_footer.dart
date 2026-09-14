import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Delightful footer indicating inbox zero status and partner response benchmark.
class InboxDelightFooter extends StatelessWidget {
  const InboxDelightFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.liveBadgeBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mark_chat_read_rounded,
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You’re up to date on partner threads',
              style: AppTextStyles.caption.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'Response rate benchmark: 94% within 2 hours',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPlaceholder,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
