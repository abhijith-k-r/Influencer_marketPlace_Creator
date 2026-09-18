import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Ambient gradient banner showing matching works telemetry count.
class WorkFilterMatchBanner extends StatelessWidget {
  final int matchCount;

  const WorkFilterMatchBanner({super.key, this.matchCount = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: AppRadii.roundedXl,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [CreatorColors.primaryContainer, CreatorColors.secondary, CreatorColors.primary],
        ),
        boxShadow: [
          BoxShadow(color: Color(0x593B46F1), blurRadius: 24, offset: Offset(0, 8)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: AppRadii.roundedMd,
                  ),
                  child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$matchCount Matching Works Found',
                        style: AppTextStyles.headlineSm(color: CreatorColors.onPrimary).copyWith(fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Synced across 2 linked creator channels',
                        style: AppTextStyles.bodySm(color: CreatorColors.onPrimaryContainer),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLowest, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
