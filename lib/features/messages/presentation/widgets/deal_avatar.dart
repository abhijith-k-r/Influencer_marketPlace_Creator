import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Circular/rounded brand avatar with verified badge overlay.
class DealAvatar extends StatelessWidget {
  final String avatarUrl;
  final String brandName;
  final bool isVerified;

  const DealAvatar({
    super.key,
    required this.avatarUrl,
    required this.brandName,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            avatarUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              color: AppColors.primaryLight.withValues(alpha: 0.15),
              child: Center(
                child: Text(
                  brandName.isNotEmpty ? brandName.substring(0, 1) : 'B',
                  style: AppTextStyles.h2.copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ),
        if (isVerified)
          Positioned(
            right: -3,
            bottom: -3,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.buttonPrimary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surfaceWhite, width: 2),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 11,
                color: AppColors.textWhite,
              ),
            ),
          ),
      ],
    );
  }
}
