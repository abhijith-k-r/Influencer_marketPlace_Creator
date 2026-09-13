import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Title and subtitle area for Step 5: Review your profile.
class Step5TitleArea extends StatelessWidget {
  const Step5TitleArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review your profile',
          style: AppTextStyles.h1,
        ),
        const SizedBox(height: 4),
        Text(
          'Double-check your information before submitting for brand discovery.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
