import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Card selector for past brand partnerships and collaboration tags.
class PastCollaborationsCard extends StatelessWidget {
  final List<String> selectedBrands;
  final ValueChanged<String>? onBrandToggled;

  static const List<String> availableBrands = [
    'Samsung', 'Sony', 'Notion', 'Logitech', 'Nike', 'Adobe', 'Spotify', 'NordVPN',
  ];

  const PastCollaborationsCard({
    super.key,
    this.selectedBrands = const ['Samsung', 'Sony', 'Notion', 'Logitech'],
    this.onBrandToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            child: Text(
              'Past Brand Partnerships',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: const BoxDecoration(
              color: AppColors.trustBadgeBackground,
              borderRadius: AppRadii.roundedPill,
            ),
            child: Text('Verified Tier', style: GoogleFonts.plusJakartaSans(
              fontSize: 10.5, fontWeight: FontWeight.w700, color: AppColors.primary,
            )),
          ),
        ]),
        const SizedBox(height: 2),
        Text('Select notable brands you have collaborated with or add custom tags.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
            )),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableBrands.map((brand) {
            final isSelected = selectedBrands.contains(brand);
            return GestureDetector(
              onTap: () => onBrandToggled?.call(brand),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.buttonPrimary : AppColors.inputBackground,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  isSelected ? '$brand ✓' : brand,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.5,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? AppColors.surfaceWhite : AppColors.textPrimary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
