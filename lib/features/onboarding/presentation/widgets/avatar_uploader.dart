import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';

/// Avatar uploader with circular frame, camera icon badge, and requirements (Figma 2:185).
class AvatarUploader extends StatelessWidget {
  final VoidCallback? onUploadTap;

  const AvatarUploader({super.key, this.onUploadTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onUploadTap,
          child: SizedBox(
            width: 96,
            height: 96,
            child: Stack(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: AppColors.inputBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.photo_camera_rounded,
                        size: 28,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'UPLOAD',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.55,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.buttonPrimary,
                      shape: BoxShape.circle,
                      boxShadow: AppShadows.cardSoft,
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      size: 16,
                      color: AppColors.surfaceWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Profile Avatar',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 24 / 16,
            letterSpacing: -0.08,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'High-res square PNG, JPG, or WEBP (Min.\n800x800)',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 18 / 13,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
