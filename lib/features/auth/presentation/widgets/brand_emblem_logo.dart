import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';

/// Animated platform emblem with dark core and spark badge.
class BrandEmblemLogo extends StatelessWidget {
  const BrandEmblemLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: AppColors.surfaceWhite,
              borderRadius: AppRadii.roundedLg,
              boxShadow: AppShadows.cardSoft,
            ),
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.buttonPrimary,
                borderRadius: AppRadii.roundedMd,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppAssets.icLogoEmblem,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  AppColors.surfaceWhite,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppAssets.icBadgeSpark,
                width: 8,
                height: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
