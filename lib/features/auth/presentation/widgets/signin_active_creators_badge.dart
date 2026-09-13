import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Pill badge displaying active creator counts with mini-avatars.
class SigninActiveCreatorsBadge extends StatelessWidget {
  const SigninActiveCreatorsBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: const BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: AppRadii.roundedPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 44,
            height: 20,
            child: Stack(
              children: [
                Positioned(left: 0, child: _buildAvatar(AppAssets.avatar1)),
                Positioned(left: 12, child: _buildAvatar(AppAssets.avatar2)),
                Positioned(left: 24, child: _buildAvatar(AppAssets.avatar3)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              AppStrings.activeCreatorsCount,
              style: AppTextStyles.fieldLabel.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String asset) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surfaceWhite, width: 1.5),
      ),
      child: ClipOval(child: Image.asset(asset, fit: BoxFit.cover)),
    );
  }
}
