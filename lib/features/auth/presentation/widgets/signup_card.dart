import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';

/// Elevated card container housing the main signup form with top gradient accent.
class SignupCard extends StatelessWidget {
  final Widget child;

  const SignupCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedLg,
        boxShadow: AppShadows.cardElevated,
      ),
      child: ClipRRect(
        borderRadius: AppRadii.roundedLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopAccentBar(),
            Padding(padding: AppSpacing.paddingCard, child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildTopAccentBar() {
    return Container(
      height: 4,
      decoration: const BoxDecoration(gradient: AppColors.cardTopGradient),
    );
  }
}
