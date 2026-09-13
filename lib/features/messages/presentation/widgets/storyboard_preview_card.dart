import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

/// Image attachment preview with frosted glass label and read receipts.
class StoryboardPreviewCard extends StatelessWidget {
  const StoryboardPreviewCard({super.key});

  static const String _imageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBDKN0_7yUe2dPjTdV7aDp-NQ6RKEf-vyuAqz8elUq_OPUlbFwduyzNDcM8vAfHjYxcG19ZD6Kee_kbheIbmED1BHq3SrH54UfdGnE6BVouunSrTPz0S8flqivGPw5-jCiMvQIFw8jxPywacdpq4uvIUDOcLmzcrncfE1NSGzwpTkIxjf0fLJ5pVvTvJgRobzuB5lVFkw6KbxHnoVs37MbEQByAxuwc2sg68n_hGfyekS07c2ypqXcZ';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 6,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _imageUrl,
                  width: 240,
                  height: 128,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    width: 240,
                    height: 128,
                    color: AppColors.inputBackground,
                    child: const Icon(
                      Icons.image_outlined,
                      size: 32,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceWhite.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Storyboard_Preview.png',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '10:46 AM',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.done_all, size: 14, color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}
