import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Interactive social platform tile with connection state and analytics summary.
class SocialPlatformTile extends StatelessWidget {
  final String platform;
  final IconData icon;
  final Color iconColor;
  final String handle;
  final String followers;
  final bool isConnected;
  final VoidCallback? onConnectTap;

  const SocialPlatformTile({
    super.key,
    required this.platform,
    required this.icon,
    required this.iconColor,
    required this.handle,
    required this.followers,
    this.isConnected = false,
    this.onConnectTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: AppRadii.roundedCard,
        border: isConnected ? Border.all(color: AppColors.primary, width: 1) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.surfaceWhite,
              borderRadius: AppRadii.roundedSm,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  platform,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isConnected ? '$handle • $followers' : 'Tap to connect channel',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: isConnected ? AppColors.textSecondary : AppColors.textPlaceholder,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onConnectTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isConnected ? AppColors.trustBadgeBackground : AppColors.buttonPrimary,
                borderRadius: AppRadii.roundedPill,
              ),
              child: Text(
                isConnected ? 'Connected ✓' : '+ Connect',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: isConnected ? AppColors.primary : AppColors.surfaceWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
