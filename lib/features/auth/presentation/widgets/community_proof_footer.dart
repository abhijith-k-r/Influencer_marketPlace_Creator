import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Community proof footer featuring overlapping creator avatars and social proof copy.
class CommunityProofFooter extends StatelessWidget {
  const CommunityProofFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAvatarStack(),
        AppSpacing.verticalSm,
        Text(
          AppStrings.communityProofText,
          textAlign: TextAlign.center,
          style: AppTextStyles.body.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAvatarStack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(AppAssets.avatar1),
        Transform.translate(
          offset: const Offset(-8, 0),
          child: _buildAvatar(AppAssets.avatar2),
        ),
        Transform.translate(
          offset: const Offset(-16, 0),
          child: _buildAvatar(AppAssets.avatar3),
        ),
        Transform.translate(
          offset: const Offset(-24, 0),
          child: _buildCountBadge(),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.avatarBorder, width: 2),
        boxShadow: AppShadows.cardSoft,
      ),
      child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
    );
  }

  Widget _buildCountBadge() {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: AppColors.pillBackground,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.avatarBorder, width: 2),
        boxShadow: AppShadows.cardSoft,
      ),
      alignment: Alignment.center,
      child: Text(
        AppStrings.communityProofCount,
        style: AppTextStyles.brandPill.copyWith(fontSize: 9),
      ),
    );
  }
}
