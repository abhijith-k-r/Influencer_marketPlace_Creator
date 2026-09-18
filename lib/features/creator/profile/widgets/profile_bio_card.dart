import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_profile_data.dart';
import 'profile_contact_credentials.dart';
import 'profile_network_matrix.dart';

/// Card containing creator bio, pro badge, network matrix, and verified contacts.
class ProfileBioCard extends StatelessWidget {
  final CreatorProfileData profile;

  const ProfileBioCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedSm),
                    child: const Icon(Icons.person_pin_circle_outlined, color: CreatorColors.primary, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'About & Creator Bio',
                    style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(color: CreatorColors.secondaryFixed, borderRadius: AppRadii.roundedFull),
                child: Text(
                  'PRO CREATOR',
                  style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixedVariant).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(profile.bio, style: AppTextStyles.bodyMd(color: CreatorColors.onSurfaceVariant).copyWith(height: 1.5)),
          const SizedBox(height: 14),
          ProfileNetworkMatrix(
            networkTotal: profile.networkTotal,
            instagram: profile.instagramFollowers,
            youtube: profile.youtubeFollowers,
            threads: profile.threadsFollowers,
          ),
          const SizedBox(height: 12),
          ProfileContactCredentials(email: profile.email, phone: profile.phone, niche: profile.niche),
        ],
      ),
    );
  }
}
