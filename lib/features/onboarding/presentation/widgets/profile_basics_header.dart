import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Header section with pill badge, h1, and descriptive subtitle matching Figma 2:172.
class ProfileBasicsHeader extends StatelessWidget {
  const ProfileBasicsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.trustBadgeBackground,
            borderRadius: AppRadii.roundedPill,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.icCreatorPill,
                width: 7,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "Let's get you verified",
                style: AppTextStyles.fieldLabel.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.verticalSm,
        Text(
          'Complete your creator profile',
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalXs,
        Text(
          'Tell brands about yourself so they can match high-\nvalue partnership campaigns right to your niche.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
