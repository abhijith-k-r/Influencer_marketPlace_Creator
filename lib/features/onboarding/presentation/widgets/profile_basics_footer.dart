import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// Community proof footer with 3 overlapping avatars matching Figma 2:263.
class ProfileBasicsFooter extends StatelessWidget {
  const ProfileBasicsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 68,
          height: 28,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: _buildAvatar(AppAssets.avatar1),
              ),
              Positioned(
                left: 20,
                child: _buildAvatar(AppAssets.avatar2),
              ),
              Positioned(
                left: 40,
                child: _buildAvatar(AppAssets.avatar3),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 18 / 13,
                color: AppColors.textSecondary,
              ),
              children: const [
                TextSpan(text: 'Joined by '),
                TextSpan(
                  text: '14,000+',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextSpan(text: ' top agency creators'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String asset) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surfaceWhite, width: 1.5),
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
