import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Target Audience Demographics section with age brackets & geo clusters (Figma).
class AudienceDemographicsSection extends StatelessWidget {
  final List<String> selectedAges;
  final List<String> selectedGeos;
  final ValueChanged<String>? onAgeToggled;
  final ValueChanged<String>? onGeoToggled;

  static const List<String> ageOptions = [
    'Gen Z (18–24)',
    'Millennials (25–34)',
    'Adults (35–49)',
  ];

  static const List<String> geoOptions = [
    '🌐 Global',
    'United States',
    'India',
    'Europe & UK',
  ];

  const AudienceDemographicsSection({
    super.key,
    this.selectedAges = const ['Gen Z (18–24)', 'Millennials (25–34)'],
    this.selectedGeos = const ['🌐 Global'],
    this.onAgeToggled,
    this.onGeoToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Target Audience Demographics',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Primary viewer age brackets & geographic clusters',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ageOptions.map((age) {
            final isSel = selectedAges.contains(age);
            return _chip(age, isSel, () => onAgeToggled?.call(age));
          }).toList(),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: geoOptions.map((geo) {
            final isSel = selectedGeos.contains(geo);
            return _chip(geo, isSel, () => onGeoToggled?.call(geo));
          }).toList(),
        ),
      ],
    );
  }

  Widget _chip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.trustBadgeBackground : AppColors.inputBackground,
          borderRadius: AppRadii.roundedPill,
          border: isSelected ? Border.all(color: AppColors.primary, width: 1) : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12.5,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
