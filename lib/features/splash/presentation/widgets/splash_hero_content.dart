import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'splash_escrow_badge.dart';

/// Central logo emblem, title, and pulsing live badge for splash screen (<65 LOC).
class SplashHeroContent extends StatelessWidget {
  const SplashHeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.35),
                    Colors.white.withValues(alpha: 0.08),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  AppAssets.collabConnectLogo,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Container(
                    color: AppColors.primaryContainer,
                    child: const Icon(Icons.handshake_rounded, size: 56, color: Colors.white),
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: -10,
              child: SplashEscrowBadge(),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text('CollabConnect', style: AppTextStyles.displayLg(color: Colors.white)),
        const SizedBox(height: 8),
        Text(
          'Where Premier Brands Meet Creator Excellence',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMd(color: Colors.white.withValues(alpha: 0.85)),
        ),
      ],
    );
  }
}
