import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Trust and verification indicator capsule.
class TrustIndicatorsBar extends StatelessWidget {
  const TrustIndicatorsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingTrustBar,
      decoration: BoxDecoration(
        color: AppColors.trustBadgeBackground,
        borderRadius: AppRadii.roundedPill,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildItem(
            icon: AppAssets.icShieldVerified,
            text: AppStrings.verifiedMarketplace,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.dotDivider,
                shape: BoxShape.circle,
              ),
            ),
          ),
          _buildItem(
            icon: AppAssets.icZeroFees,
            text: AppStrings.zeroDiscoveryFees,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required String icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 12,
          height: 12,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        AppSpacing.horizontalSm,
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.trustBadge,
        ),
      ],
    );
  }
}
