import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Modal grab handle and top header for AuthBottomSheet.
class AuthModalHeader extends StatelessWidget {
  final VoidCallback onClose;

  const AuthModalHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.onSurface.withValues(alpha: 0.15),
              borderRadius: AppRadii.roundedPill,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: AppRadii.roundedPill,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.stars_rounded, size: 14, color: AppColors.primary),
                        const SizedBox(width: 5),
                        Text(
                          'FAST-TRACK PASS',
                          style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Log in or Sign up', style: AppTextStyles.headlineMd(color: AppColors.onSurface)),
                  const SizedBox(height: 4),
                  Text(
                    'Join thousands of verified brands & creators collaborating today',
                    style: AppTextStyles.bodySm(color: AppColors.tertiary),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onClose,
              borderRadius: AppRadii.roundedPill,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 18, color: AppColors.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
