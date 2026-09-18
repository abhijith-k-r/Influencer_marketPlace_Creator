import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class PaymentDetailsTopBar extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onDownloadTap;

  const PaymentDetailsTopBar({
    super.key,
    required this.onBackTap,
    this.onShareTap,
    this.onDownloadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBackTap,
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerLow,
              foregroundColor: AppColors.onSurface,
              minimumSize: const Size(40, 40),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.verified_user_rounded,
                color: AppColors.secondary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'ESCROW VERIFIED RECEIPT',
                style: AppTextStyles.labelSm(color: AppColors.tertiary),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onShareTap,
                icon: const Icon(Icons.share_outlined, size: 18),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerLow,
                  foregroundColor: AppColors.onSurface,
                  minimumSize: const Size(40, 40),
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                onPressed: onDownloadTap,
                icon: const Icon(Icons.download_outlined, size: 18),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerLow,
                  foregroundColor: AppColors.onSurface,
                  minimumSize: const Size(40, 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
