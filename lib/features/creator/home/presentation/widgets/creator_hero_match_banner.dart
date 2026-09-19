import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorHeroMatchBanner extends StatelessWidget {
  final int matchCount;
  final String topCategory;

  const CreatorHeroMatchBanner({
    super.key,
    this.matchCount = 8,
    this.topCategory = 'Streetwear & Tech',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [CreatorColors.primary, CreatorColors.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadii.roundedXl,
        boxShadow: [
          BoxShadow(
            color: Color(0x383B46F1),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0x33FFFFFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$matchCount Deals Matched',
                      style: AppTextStyles.labelLg(color: Colors.white).copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Color(0x33FFFFFF),
                        borderRadius: AppRadii.roundedFull,
                      ),
                      child: Text(
                        '96% FIT',
                        style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontSize: 9, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Curated for your audience in $topCategory',
                  style: AppTextStyles.labelSm(color: Colors.white.withValues(alpha: 0.85)).copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
