import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Title and descriptive subtitle for Experience & Portfolio step.
class Step4TitleSection extends StatelessWidget {
  const Step4TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience & Portfolio',
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalXs,
        Text(
          'Showcase brand collaborations, top-performing campaign links, '
          'and proven performance metrics to unlock premium rates.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
