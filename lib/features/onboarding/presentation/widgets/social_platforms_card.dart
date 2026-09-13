import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'social_platform_tile.dart';

/// Card container with primary social platform connection tiles.
class SocialPlatformsCard extends StatelessWidget {
  const SocialPlatformsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Primary Social Accounts',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: const BoxDecoration(
                  color: AppColors.trustBadgeBackground,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  'Min. 1 Required',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.5, fontWeight: FontWeight.w700, color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            'Connect the accounts where you publish sponsored collaborations.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 14),
          const SocialPlatformTile(
            platform: 'YouTube',
            icon: Icons.play_circle_fill_rounded,
            iconColor: Color(0xFFFF0000),
            handle: '@auravance',
            followers: '142K subs',
            isConnected: true,
          ),
          const SizedBox(height: 10),
          const SocialPlatformTile(
            platform: 'Instagram',
            icon: Icons.camera_alt_rounded,
            iconColor: Color(0xFFE1306C),
            handle: '@auravance.tech',
            followers: '89.4K followers',
            isConnected: true,
          ),
          const SizedBox(height: 10),
          const SocialPlatformTile(
            platform: 'TikTok',
            icon: Icons.music_note_rounded,
            iconColor: Color(0xFF000000),
            handle: '',
            followers: '',
            isConnected: false,
          ),
          const SizedBox(height: 10),
          const SocialPlatformTile(
            platform: 'Twitch',
            icon: Icons.sports_esports_rounded,
            iconColor: Color(0xFF9146FF),
            handle: '',
            followers: '',
            isConnected: false,
          ),
        ],
      ),
    );
  }
}
