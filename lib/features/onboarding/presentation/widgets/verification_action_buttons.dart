import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Action buttons for Verification screen: Check Status & Back to Profile.
class VerificationActionButtons extends StatelessWidget {
  final VoidCallback? onCheckStatus;
  final VoidCallback? onBackToProfile;

  const VerificationActionButtons({
    super.key,
    this.onCheckStatus,
    this.onBackToProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onCheckStatus,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              foregroundColor: AppColors.surfaceWhite,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedCard,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sync, size: 18, color: AppColors.surfaceWhite),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Check Verification Status',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.buttonPrimary.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onBackToProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surfaceWhite,
              foregroundColor: AppColors.textPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedCard,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: AppColors.textPrimary,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Back to Profile',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.buttonPrimary.copyWith(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
