import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';

/// Top navigation bar for Brand Profile screen — back, verified badge, settings.
class BrandProfileTopBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSettings;

  const BrandProfileTopBar({super.key, this.onBack, this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          iconSize: 16,
          size: 40,
          backgroundColor: AppColors.surfaceContainerLowest,
          onTap: onBack ??
              () {
                if (Navigator.of(context).canPop()) Navigator.of(context).pop();
              },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: AppRadii.roundedPill,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'ENTERPRISE VERIFIED',
                style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        AppIconButton(
          icon: Icons.settings_outlined,
          size: 40,
          backgroundColor: AppColors.surfaceContainerLowest,
          onTap: onSettings,
        ),
      ],
    );
  }
}
