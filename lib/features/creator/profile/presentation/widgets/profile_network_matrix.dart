import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Network footprint container showing total reach and breakdown by platform.
class ProfileNetworkMatrix extends StatelessWidget {
  final String networkTotal;
  final String instagram;
  final String youtube;
  final String threads;

  const ProfileNetworkMatrix({
    super.key,
    required this.networkTotal,
    required this.instagram,
    required this.youtube,
    required this.threads,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Network Footprint', style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
              Text(networkTotal, style: AppTextStyles.headlineSm(color: CreatorColors.primary).copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildPlatformBox(Icons.photo_camera_rounded, instagram, 'Instagram')),
              const SizedBox(width: 8),
              Expanded(child: _buildPlatformBox(Icons.smart_display_rounded, youtube, 'YouTube')),
              const SizedBox(width: 8),
              Expanded(child: _buildPlatformBox(Icons.alternate_email_rounded, threads, 'Threads/X')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformBox(IconData icon, String count, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedSm,
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: CreatorColors.primary),
          const SizedBox(height: 4),
          Text(count, style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
          Text(label, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant).copyWith(fontSize: 10)),
        ],
      ),
    );
  }
}
