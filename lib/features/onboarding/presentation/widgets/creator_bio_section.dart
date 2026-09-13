import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Creator Bio input card with character counter and suggestions (Figma).
class CreatorBioSection extends StatelessWidget {
  final TextEditingController? controller;

  const CreatorBioSection({super.key, this.controller});

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
              Text(
                'Creator Bio',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                ),
              ),
              Text(
                '0/160',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textPlaceholder,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'A crisp hook explaining what your channel is famous for.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: AppRadii.roundedInput,
            ),
            child: TextFormField(
              controller: controller,
              maxLines: 3,
              style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppColors.textPrimary),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'Passionate tech reviewer & lifestyle storyteller '
                    'crafting honest deep-dives and sleek daily setups...',
                hintStyle: GoogleFonts.plusJakartaSans(
                  fontSize: 13.5, height: 1.4, color: AppColors.textPlaceholder,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 4,
            children: [
              Text('Suggestions: ', style: GoogleFonts.plusJakartaSans(
                fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary,
              )),
              _chip('Gear minimalist'),
              _chip('Travel filmmaker'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: const BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: AppRadii.roundedPill,
        ),
        child: Text(label, style: GoogleFonts.plusJakartaSans(
          fontSize: 11.5, fontWeight: FontWeight.w500, color: AppColors.textPrimary,
        )),
      );
}
