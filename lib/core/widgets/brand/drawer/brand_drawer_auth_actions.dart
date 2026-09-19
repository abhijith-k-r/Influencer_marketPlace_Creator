import 'package:flutter/material.dart';
import '../../../../features/auth/presentation/views/auth_bottom_sheet.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

/// Welcome prompt and quick sign in/up CTA buttons inside Brand drawer.
class BrandDrawerAuthActions extends StatelessWidget {
  const BrandDrawerAuthActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ready to collaborate?',
                style: AppTextStyles.labelMd(color: AppColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                'Join 24,000+ top creators and access high-paying brand campaigns.',
                style: AppTextStyles.bodySm(color: AppColors.tertiary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                AuthBottomSheet.show(context);
              },
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.person_add_alt_1_rounded, size: 20, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Sign Up Free',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.labelLg(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                AuthBottomSheet.show(context);
              },
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.login_rounded, size: 20, color: AppColors.tertiary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Sign In',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.labelLg(color: AppColors.onSurface),
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, size: 20, color: AppColors.tertiary),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
