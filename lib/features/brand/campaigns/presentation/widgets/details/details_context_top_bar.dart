import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class DetailsContextTopBar extends StatelessWidget {
  final String campaignId;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onShare;

  const DetailsContextTopBar({
    super.key,
    required this.campaignId,
    required this.onBack,
    required this.onEdit,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onBack,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                shape: const CircleBorder(),
                minimumSize: const Size(40, 40),
              ),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campaign Details',
                  style: AppTextStyles.headlineSm(color: AppColors.onSurface),
                ),
                Text(
                  'ID: #$campaignId',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: onEdit,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                shape: const CircleBorder(),
                minimumSize: const Size(40, 40),
              ),
              icon: const Icon(Icons.edit_outlined, size: 18, color: AppColors.onSurface),
            ),
            const SizedBox(width: 6),
            IconButton(
              onPressed: onShare,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                shape: const CircleBorder(),
                minimumSize: const Size(40, 40),
              ),
              icon: const Icon(Icons.ios_share_rounded, size: 18, color: AppColors.onSurface),
            ),
          ],
        ),
      ],
    );
  }
}
