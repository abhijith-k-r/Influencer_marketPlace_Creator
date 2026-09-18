import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Log Out button and security footnote displayed at the bottom of the profile.
class ProfileLogoutSection extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileLogoutSection({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: onLogout,
            icon: const Icon(Icons.logout_rounded, size: 20),
            label: Text(
              'Log Out',
              style: AppTextStyles.labelLg(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: CreatorColors.primaryContainer,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, size: 14, color: CreatorColors.primary),
            const SizedBox(width: 4),
            Text(
              'CollabConnect Creator v2.4.1 • End-to-End Escrow',
              style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Empowering 40,000+ Independent Creators in India',
          style: AppTextStyles.bodySm(color: CreatorColors.outline),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
