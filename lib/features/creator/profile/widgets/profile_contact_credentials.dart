import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Contact information and niche tags with verification badges.
class ProfileContactCredentials extends StatelessWidget {
  final String email;
  final String phone;
  final String niche;

  const ProfileContactCredentials({
    super.key,
    required this.email,
    required this.phone,
    required this.niche,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCredentialRow(Icons.mail_outline_rounded, email, true),
        const SizedBox(height: 8),
        _buildCredentialRow(Icons.call_outlined, phone, true),
        const SizedBox(height: 8),
        _buildCredentialRow(Icons.sell_outlined, niche, false, trailingIcon: Icons.category_outlined),
      ],
    );
  }

  Widget _buildCredentialRow(IconData icon, String text, bool isVerified, {IconData? trailingIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: CreatorColors.surface,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: 18, color: CreatorColors.onSurfaceVariant),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: AppTextStyles.bodyMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isVerified)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: const BoxDecoration(
                color: CreatorColors.surfaceContainerHighest,
                borderRadius: AppRadii.roundedFull,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_rounded, size: 12, color: CreatorColors.primary),
                  const SizedBox(width: 3),
                  Text(
                    'Verified',
                    style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          else if (trailingIcon != null)
            Icon(trailingIcon, size: 18, color: CreatorColors.onSurfaceVariant),
        ],
      ),
    );
  }
}
