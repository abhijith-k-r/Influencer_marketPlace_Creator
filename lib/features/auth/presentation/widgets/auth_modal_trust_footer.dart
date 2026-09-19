import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Trust badges and legal terms footer inside AuthBottomSheet.
class AuthModalTrustFooter extends StatelessWidget {
  const AuthModalTrustFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline_rounded, size: 14, color: AppColors.tertiary),
            const SizedBox(width: 6),
            Text(
              'End-to-End Encrypted • Bank-Grade Escrow Vault',
              style: AppTextStyles.labelSm(color: AppColors.tertiary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Center(
          child: Text.rich(
            TextSpan(
              text: 'By signing up, you agree to the ',
              style: AppTextStyles.labelSm(color: AppColors.tertiary),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
