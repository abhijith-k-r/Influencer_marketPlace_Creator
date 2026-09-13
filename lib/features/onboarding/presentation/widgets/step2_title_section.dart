import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Main title and subtitle section for Creator Details step.
class Step2TitleSection extends StatelessWidget {
  const Step2TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tell us about your content',
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalXs,
        Text(
          'This helps matching brands discover your profile for\n'
          'high-yield, relevant campaigns.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
