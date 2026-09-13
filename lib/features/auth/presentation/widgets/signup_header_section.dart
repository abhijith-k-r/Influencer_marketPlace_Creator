import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'brand_emblem_logo.dart';

/// Top header section displaying the brand emblem, badge pill, title, and subtitle.
class SignupHeaderSection extends StatelessWidget {
  const SignupHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BrandEmblemLogo(),
        AppSpacing.verticalLg,
        _buildBrandPill(),
        AppSpacing.verticalMd,
        Text(
          AppStrings.signupTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalSm,
        Text(
          AppStrings.signupSubtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }

  Widget _buildBrandPill() {
    return Container(
      padding: AppSpacing.paddingPill,
      decoration: const BoxDecoration(
        color: AppColors.pillBackground,
        borderRadius: AppRadii.roundedPill,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.icCreatorPill, width: 12, height: 12),
          AppSpacing.horizontalSm,
          Text(AppStrings.creatorPlatform, style: AppTextStyles.brandPill),
        ],
      ),
    );
  }
}
