import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Interactive brand partnership tag selector field for Step 4.
class PortfolioBrandChipsField extends StatelessWidget {
  final List<String> selectedBrands;
  final ValueChanged<String>? onBrandToggled;

  static const List<String> defaultBrands = [
    'Samsung', 'Sony', 'Notion', 'Logitech', 'Nike', 'Adobe', 'Spotify', 'NordVPN',
  ];

  const PortfolioBrandChipsField({
    super.key,
    this.selectedBrands = const ['Samsung', 'Sony', 'Notion', 'Logitech'],
    this.onBrandToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Past Brand Collaborations',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'VERIFIED TIER',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.66, color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Select notable brands you have collaborated with or add custom tags.',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: defaultBrands.map((brand) {
            final isSel = selectedBrands.contains(brand);
            return GestureDetector(
              onTap: () => onBrandToggled?.call(brand),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSel ? AppColors.buttonPrimary : AppColors.inputBackground,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  isSel ? '$brand ✓' : brand,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.5,
                    fontWeight: isSel ? FontWeight.w600 : FontWeight.w500,
                    color: isSel ? AppColors.surfaceWhite : AppColors.textPrimary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
