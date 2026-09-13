import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'avatar_uploader.dart';
import 'profile_basics_form.dart';

/// Main White Card with Ambient Top Glow Strip matching Figma 2:183.
class ProfileBasicsCard extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback? onSaveLater;

  const ProfileBasicsCard({
    super.key,
    required this.onContinue,
    this.onSaveLater,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
      ),
      child: ClipRRect(
        borderRadius: AppRadii.roundedCard,
        child: Column(
          children: [
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE1E0FF),
                    Color(0xFFE5EEFF),
                    Color(0xFFC0C1FF),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const AvatarUploader(),
                  const SizedBox(height: 24),
                  ProfileBasicsForm(
                    onContinue: onContinue,
                    onSaveLater: onSaveLater,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
