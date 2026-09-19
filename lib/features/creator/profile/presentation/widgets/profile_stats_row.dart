import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Row of stat pills showing Reach, Rating, and Collabs.
class ProfileStatsRow extends StatelessWidget {
  final String reach;
  final String rating;
  final String collabs;

  const ProfileStatsRow({
    super.key,
    required this.reach,
    required this.rating,
    required this.collabs,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildPill(Icons.trending_up_rounded, reach, 'Reach'),
        _buildPill(Icons.star_rounded, rating, 'Rating'),
        _buildPill(Icons.handshake_rounded, collabs, 'Collabs'),
      ],
    );
  }

  Widget _buildPill(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedFull,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: CreatorColors.primary),
          const SizedBox(width: 4),
          Text(
            value,
            style: AppTextStyles.labelMd(
              color: CreatorColors.onSurface,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
