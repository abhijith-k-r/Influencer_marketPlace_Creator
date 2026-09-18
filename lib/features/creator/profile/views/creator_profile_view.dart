import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorProfileView extends StatelessWidget {
  const CreatorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.headlineMd(color: CreatorColors.onSurface)),
        backgroundColor: CreatorColors.surfaceContainerLowest,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: CreatorColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_rounded, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                'Aarav Sharma',
                style: AppTextStyles.headlineMd(color: CreatorColors.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                'Sneakerhead & Streetwear Specialist • 140k Reach',
                style: AppTextStyles.bodySm(color: CreatorColors.outline),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: CreatorColors.primaryFixed,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Profile Verified by CollabConnect',
                  style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
