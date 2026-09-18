import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_profile_data.dart';
import 'profile_stats_row.dart';

/// Top header card showing creator avatar, verified badge, stats, and edit CTA.
class ProfileHeaderCard extends StatelessWidget {
  final CreatorProfileData profile;
  final VoidCallback onEditProfile;

  const ProfileHeaderCard({super.key, required this.profile, required this.onEditProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(color: CreatorColors.surfaceContainerHigh, shape: BoxShape.circle),
                child: const Center(child: Icon(Icons.person_rounded, size: 54, color: CreatorColors.primary)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(color: CreatorColors.primaryContainer, shape: BoxShape.circle),
                  child: const Icon(Icons.photo_camera_rounded, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  profile.name,
                  style: AppTextStyles.headlineLg(color: CreatorColors.onSurface).copyWith(fontSize: 22, fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.verified_rounded, color: CreatorColors.primaryContainer, size: 20),
            ],
          ),
          const SizedBox(height: 4),
          Text('${profile.handle} • ${profile.tagline}', style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          ProfileStatsRow(reach: profile.reach, rating: profile.rating, collabs: profile.collabs),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: onEditProfile,
              icon: const Icon(Icons.edit_rounded, size: 18),
              label: Text('Edit Profile & Media Kit', style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: CreatorColors.surfaceContainerLow,
                foregroundColor: CreatorColors.primary,
                elevation: 0,
                shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
