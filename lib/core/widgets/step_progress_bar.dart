import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Standard step progress bar for the 5-step creator onboarding flow.
class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String stepTitle;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
    required this.stepTitle,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (currentStep / totalSteps).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'STEP $currentStep OF $totalSteps',
              style: AppTextStyles.brandPill.copyWith(
                color: AppColors.primary,
                letterSpacing: 0.8,
              ),
            ),
            const Spacer(),
            Flexible(
              child: Text(
                stepTitle,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        AppSpacing.verticalSm,
        Container(
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: AppRadii.roundedPill,
          ),
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: constraints.maxWidth * progress,
                height: 6,
                decoration: const BoxDecoration(
                  gradient: AppColors.cardTopGradient,
                  borderRadius: AppRadii.roundedPill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
