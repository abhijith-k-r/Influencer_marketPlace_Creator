import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'profile_settings_tile.dart';

/// Container for Account & Preferences settings options.
class ProfileAccountSettingsCard extends StatelessWidget {
  const ProfileAccountSettingsCard({super.key});

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
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedSm),
                child: const Icon(Icons.manage_accounts_outlined, color: CreatorColors.primary, size: 18),
              ),
              const SizedBox(width: 8),
              Text(
                'Account & Preferences',
                style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ProfileSettingsTile(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Payment Methods & UPI',
            subtitle: 'HDFC Bank ending •••• 4819 & UPI ID',
            onTap: () {},
          ),
          ProfileSettingsTile(
            icon: Icons.lock_outline_rounded,
            title: 'Change Password & Security',
            subtitle: '2FA Enabled & Biometric Login',
            onTap: () {},
          ),
          ProfileSettingsTile(
            icon: Icons.notifications_none_rounded,
            title: 'Notification Preferences',
            subtitle: 'Push & Email alerts active',
            onTap: () {},
          ),
          ProfileSettingsTile(
            icon: Icons.visibility_outlined,
            title: 'Privacy & Deal Visibility',
            subtitle: 'Public marketplace profile',
            onTap: () {},
          ),
          ProfileSettingsTile(
            icon: Icons.description_outlined,
            title: 'Tax & TDS Documents',
            subtitle: 'Form 16A & GSTIN records',
            onTap: () {},
          ),
          ProfileSettingsTile(
            icon: Icons.support_agent_rounded,
            title: 'Help & Escrow Support',
            subtitle: '24/7 Creator concierge',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
