import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Title and descriptive subtitle for Social Media Connection step.
class Step3TitleSection extends StatelessWidget {
  const Step3TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect your social channels',
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalXs,
        Text(
          'Link your primary accounts to verify audience metrics, '
          'engagement rates, and qualify for high-tier brand deals.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
