import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Micro-bento cards highlighting platform features (Escrow and Media Kit).
class BentoPerksRow extends StatelessWidget {
  const BentoPerksRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildBentoCard(
            icon: AppAssets.icEscrow,
            title: AppStrings.instantEscrowTitle,
            subtitle: AppStrings.instantEscrowSubtitle,
          ),
        ),
        AppSpacing.horizontalMd,
        Expanded(
          child: _buildBentoCard(
            icon: AppAssets.icMediaKit,
            title: AppStrings.autoMediaKitTitle,
            subtitle: AppStrings.autoMediaKitSubtitle,
          ),
        ),
      ],
    );
  }

  Widget _buildBentoCard({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: AppSpacing.paddingBentoCard,
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: AppRadii.roundedSm,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          AppSpacing.horizontalSm,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.fieldLabel.copyWith(fontSize: 11),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
