import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorHeroMatchBanner extends StatelessWidget {
  const CreatorHeroMatchBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: CreatorColors.heroGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: CreatorColors.primaryContainer.withValues(alpha: 0.35), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.stars_rounded, size: 14, color: CreatorColors.primaryFixed),
                    const SizedBox(width: 5),
                    Text(
                      'ALGORITHM MATCH',
                      style: AppTextStyles.labelSm(color: CreatorColors.primaryFixed).copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: CreatorColors.primaryFixed,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '98% High Match',
                  style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Opportunities For You',
                      style: AppTextStyles.headlineMd(color: Colors.white).copyWith(letterSpacing: -0.3),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Curated high-intent deals aligned with your engagement & reach stats.',
                      style: AppTextStyles.bodySm(color: CreatorColors.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.auto_awesome_rounded, size: 24, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
