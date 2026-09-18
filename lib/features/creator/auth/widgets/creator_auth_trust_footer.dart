import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorAuthTrustFooter extends StatelessWidget {
  const CreatorAuthTrustFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: CreatorColors.surfaceContainerHigh)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'INSTITUTIONAL TRUST',
                style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(letterSpacing: 0.8),
              ),
            ),
            const Expanded(child: Divider(color: CreatorColors.surfaceContainerHigh)),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: CreatorColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.verified_user_rounded, size: 18, color: CreatorColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Escrow-backed contracts',
                    style: AppTextStyles.bodySm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                '100% Secure',
                style: AppTextStyles.labelSm(color: CreatorColors.secondary).copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'By continuing, you agree to our Terms of Service & Privacy Policy.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySm(color: CreatorColors.outline),
          ),
        ),
      ],
    );
  }
}
